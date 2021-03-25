import Foundation

/*let jsonString = """
{"firstName":"Sergio","lastName":"Conti", "age": 10, "sex": male, "descendants": [
    "firstName":"Matthew","lastName":"Giko", "age": 30, "sex": male, "descendants": [], "occupation": .doctor
], "occupation": nil}
"""
 "spouse": "nil"*/

let jsonString = """
{
    "firstName": "Matei",
    "lastName": "Radu",
    "age": 40,
    "sex": "male",
    "descendants": [],
    "occupation": "doctor",
}
"""

let jsonData = Data(jsonString.utf8) //convert json string to object

enum EngineerType: String,  Decodable {
    case software
    case autoMotive
    case aeroSpatial
}

enum Sex: String, Decodable {
    case male
    case female
}

enum Occupation {
    
    static func create(from string: String) -> Occupation? {
        let values = string.split(separator: " ").map({ String($0)})
        if let primary = values.first {
            switch primary {
                case "doctor": return .doctor
                case "student": return .student
                case "retired": return .retired
                case "athlete": return .athlete
                case "engineer":
                    if values.count == 2, let type = EngineerType(rawValue: values[1]) {
                        return .engineer(type: type)
                    } else if values.count == 3, let type = EngineerType(rawValue: values[2]) {
                        return .engineer(type: type)
                    } else if values.count == 4, let type = EngineerType(rawValue: values[3]) {
                        return .engineer(type: type)
                    } else { return nil }
                default:
                    return nil
            }
        }
        return nil
    }
    case doctor
    case student
    case engineer(type: EngineerType)
    case retired
    case athlete

}

class Person: Decodable {
    
    var firstName: String
    var lastName: String
    var age: Int
    var sex: Sex
    var descendants: [Person]
    var occupation: Occupation?
    var isVisited = false
  //  var spouse: Person?
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
        case sex
        case descendants
        case occupation
     //   case spouse
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       
        let firstNameVal = try values.decode(String.self, forKey: .firstName)
        self.firstName = firstNameVal
    
        let lastNameVal = try values.decode(String.self, forKey: .lastName)
        self.lastName = lastNameVal
        
        let ageVal = try values.decode(Int.self, forKey: .age)
        self.age = ageVal
       
        let sexVal = try values.decode(Sex.self, forKey: .sex)
        self.sex = sexVal
        
        let descendantsVal = try values.decode([Person].self, forKey: .descendants)
        self.descendants = descendantsVal

        let occupationVal = try values.decode(String.self, forKey: .occupation)
        self.occupation = Occupation.create(from: occupationVal)
        
       // let spouseVal = try values.decode(Person.self, forKey: .spouse)
//self.spouse = spouseVal
        
    }
    
    init(firstName: String, lastName: String, age: Int, sex: Sex, descendants: [Person], occupation: Occupation?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.sex = sex
        self.descendants = descendants
        self.occupation = occupation
    }

    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var description: String {
       if descendants.count > 0{
            return "\(firstName.capitalized) is a \(age) year old \(sex) \(occupation!) and has \(descendants.count) sons."
        }
        else{
            return "\(firstName.capitalized) is a \(age) year old \(sex) \(occupation!) and doesn't have any sons."
        }
    }
    
    var adultSons: [String] {
        return descendants.filter({ $0.age >= 18}).map({$0.firstName})
    }
    
    func addBaby(firstName: String, sex: Sex) {
        let baby = Person(firstName: firstName, lastName: self.lastName, age: 0, sex: sex, descendants: [], occupation: nil)
        descendants.append(baby)
    }
}

class FamilyTree: Decodable {
    var firstAncestor: Person
    
    init(firstAncestor: Person) {
        self.firstAncestor = firstAncestor
    }

    func showMembers(person: Person) -> [String] {
        
        var result: [String] = [person.fullName]
        person.isVisited = true
        for descendant in person.descendants {
                if !descendant.isVisited {
                    result += showMembers(person: descendant)
                }
        }
        person.isVisited = false
        return result
    }
    
    func showAncestors(from person: Person, to personToFind: Person) {
        print("\(person.fullName) -> ")
        person.isVisited = true
        if person.fullName != personToFind.fullName {
           
            for descendant in person.descendants {
                if !descendant.isVisited {
                    return showAncestors(from: descendant, to: personToFind)
                }
            }
        }
        person.isVisited = false
    }

    func showMembersWithOccupation() -> [String] {
        
        var result = (firstAncestor.occupation != nil ? [firstAncestor.fullName] : [])
        firstAncestor.isVisited = true
        for descendant in firstAncestor.descendants {
            if !descendant.isVisited && descendant.occupation != nil {
                result += showMembers(person: descendant)
            }
        }
        return result
    }
    
    func searchPerson(personToFind: Person) -> String {
        let allMembers = showMembers(person: firstAncestor)
    
        var result: String = "The person you are looking for is "
        for member in allMembers {
            if member.contains(personToFind.fullName) {
                result += member
                break
            }
        }
        return result
    }
    
    func showCousins(person: Person) -> [String] {
       /* guard let person2 = person
        if sameChildren(person1: person, person2: person.spouse!) {
            return [person.fullName]
        }
         */
        return []
    }
    func buildFromJson(data: Data) -> Person? {
        var result: Person?
        do {
            result = try JSONDecoder().decode(Person.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return result
    }
}

func sameChildren(person1: Person, person2: Person) -> Bool {
    
    if person1.sex == person2.sex {
        return false
    }
    
    let p1Children = person1.descendants.count
    let p2Children = person2.descendants.count
    
    if p1Children == p2Children && p1Children > 0 {
        for child in person1.descendants {
            var isFound:Bool = false
            for child2 in person2.descendants {
                if child.fullName == child2.fullName { isFound = true }
            }
            if isFound == false { return false }
        }
        return true
    }
    return false
}

var person2 = Person(firstName: "Sergiu", lastName: "Corbu", age: 20, sex: .male, descendants: [], occupation: .engineer(type: .software))
var person4 = Person(firstName: "Ana", lastName: "Moldovan", age: 68, sex: .female, descendants: [], occupation: .retired)
var person1 = Person(firstName: "Jim", lastName: "Mac", age: 39, sex: .male, descendants: [person4], occupation: .athlete)
var person3 = Person(firstName: "Jack", lastName: "Wills", age: 40, sex: .male, descendants: [], occupation: nil)

var person0 = Person(firstName: "Tom", lastName: "Green", age: 43, sex: .male, descendants: [person1, person2, person3], occupation: .doctor)

var person0_ = Person(firstName: "Andreea", lastName: "Green", age: 41, sex: .female, descendants: [person1, person2, person3], occupation: .doctor)

//person0.spouse = person0_
//person0_.spouse = person0

var fam1 = FamilyTree(firstAncestor: person0)
var fam2 = FamilyTree(firstAncestor: person0_)
//print(person1.adultSons)
person1.addBaby(firstName: "Alina", sex: .female)
//print(person0.descendants)

//print(fam1.searchPerson(personToFind: person3))

//print(fam1.showMembers(person: person0))

//print("Members with occupation are: ")
//print(fam1.showMembersWithOccupation())
//print(fam1.showCousins(person: person4))
//print(fam1.showAncestors(from: person0, to: person4))


if let data = fam1.buildFromJson(data: jsonData) {
    print("\(data.description)")
}

/* --ok
if sameChildren(person1: person0, person2: person0_) {
    print("same children")
} else {
    print("errorr")
} */
