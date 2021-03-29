import Foundation

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
        let values = string.split(separator: " ").map({ String($0) })
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
    weak var parent: Person?
    var spouse: Person?
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
        case sex
        case descendants
        case occupation
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
       if descendants.count > 0 {
            return "\(firstName.capitalized) is a \(age) year old \(sex) \(occupation!) and has \(descendants.count) children."
        }
        else {
            return "\(firstName.capitalized) is a \(age) year old \(sex) \(occupation!) and doesn't have children."
        }
    }
    
    var adultSons: [String] {
        let sons: [String] = descendants.filter({ $0.age >= 18}).map({$0.firstName})
        if !sons.isEmpty {
            print("\(fullName) has \(sons.count) adult children: ")
            return sons
        }
        return ["\(fullName) doesn't have any adult children"]
    }
    
    func addBaby(firstName: String, sex: Sex) {
        let baby = Person(firstName: firstName, lastName: self.lastName, age: 0, sex: sex, descendants: [], occupation: nil)
        baby.parent = self
        descendants.append(baby)
    }
}

class FamilyTree: Decodable {
    var firstAncestor: Person
    
    init(firstAncestor: Person) {
        self.firstAncestor = firstAncestor
    }
    
    func initializeHierarchy(person: Person) { // to set the parent for every person
        person.isVisited = true
        for descendant in person.descendants {
            descendant.parent = person
            if !descendant.isVisited {
                showMembers(person: descendant)
            }
        }
        person.isVisited = false
    }
    
    func showMembers(person: Person) -> [String] {
        
        var result: [String] = [person.fullName]
        person.isVisited = true
        for descendant in person.descendants {
            descendant.parent = person
            if !descendant.isVisited {
                result += showMembers(person: descendant)
            }
        }
        person.isVisited = false
        return result
    }
    
    func showMembersWithOccupation() -> [String] {
        
        var result = (firstAncestor.occupation != nil ? [firstAncestor.fullName] : [])
        firstAncestor.isVisited = true
        for descendant in firstAncestor.descendants {
            if !descendant.isVisited && descendant.occupation != nil {
                result += showMembers(person: descendant)
            }
        }
        firstAncestor.isVisited = false
        return result
    }
    
    func searchPerson(personToFind: Person) -> String {
        let allMembers = showMembers(person: firstAncestor)
        
        var result: String = "The person you are looking for is "
        for member in allMembers {
            if member.contains(personToFind.fullName) {
                result += personToFind.fullName
                result += ". "
                result += personToFind.description
                break
            }
        }
        if result.isEmpty { result = "The person does not exist" }
        return result
    }
    
    public var ancestors: [String] = []
    func showAncestors(from person: Person) -> [String] {
        if let parent = person.parent {
            ancestors.append(parent.fullName)
            showAncestors(from: parent)
        }
        return ancestors
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
    
    func showCousins(person: Person) -> [String] {
        initializeHierarchy(person: person0)
        initializeHierarchy(person: person0_)
        
        guard let thisParent = person.parent else { return ["\(person.fullName) doesn't have a parent"] }
        guard let spouse = thisParent.spouse else { return ["\(person.fullName) doesn't have a spouse"] }
        var allCousins: [String] = []
        
        if sameChildren(person1: thisParent, person2: spouse) {
            
            if let grandParent = thisParent.parent { // cousins from father's side
                for children in grandParent.descendants {
                    if children.fullName != thisParent.fullName {
                        for child in children.descendants { allCousins += [child.fullName] }
                    }
                }
            }
            if let grandParent = spouse.parent { // cousins from mother's side
                for children in grandParent.descendants {
                    if children.fullName != spouse.fullName {
                        for child in children.descendants { allCousins += [child.fullName] }
                    }
                }
            }
            
            return allCousins
        }
        return ["Error! Please revise the data provided"]
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

//the data for fam1
var person2 = Person(firstName: "Sergiu", lastName: "Corbu", age: 20, sex: .male, descendants: [], occupation: .engineer(type: .software))
var person6 = Person(firstName: "Bianca", lastName: "Moldovan", age: 18, sex: .female, descendants: [], occupation: .athlete)
var person4 = Person(firstName: "Ana", lastName: "Moldovan", age: 28, sex: .female, descendants: [person6], occupation: .athlete)
var person1 = Person(firstName: "Paul", lastName: "Moldovan", age: 59, sex: .male, descendants: [person4], occupation: .retired)
var person5 = Person(firstName: "Maria", lastName: "Dumitru", age: 19, sex: .female, descendants: [], occupation: .student)
var person3 = Person(firstName: "Sebi", lastName: "Dumitru", age: 40, sex: .male, descendants: [person5], occupation: nil)

var person0 = Person(firstName: "Tom", lastName: "Moldovan", age: 43, sex: .male, descendants: [person1, person2, person3], occupation: .doctor)

//the data for fam2

var person1_ = Person(firstName: "Maria", lastName: "Moldovan", age: 51, sex: .female, descendants: [person4], occupation: .doctor)
var person3_ = Person(firstName: "Toby", lastName: "Green", age: 11, sex: .male, descendants: [], occupation: nil)
var person2_ = Person(firstName: "Martin", lastName: "Green", age: 31, sex: .male, descendants: [person3_], occupation: .doctor)
var person0_ = Person(firstName: "Andreea", lastName: "Moldovan", age: 41, sex: .female, descendants: [person1_, person2_], occupation: .doctor)

person4.addBaby(firstName: "Alina", sex: .female)

person0.spouse = person0_
person0_.spouse = person0

person1.spouse = person1_
person1_.spouse = person1

var fam1 = FamilyTree(firstAncestor: person0)
var fam2 = FamilyTree(firstAncestor: person0_)



print(person0.adultSons)
print("\n")
print(fam1.searchPerson(personToFind: person5))
print("\n")
print("Members from fam1 are: \(fam1.showMembers(person: person0))")
print("\n")
print("Members from fam2 are: \(fam2.showMembers(person: person0_))")
print("\n")
print("Members with occupation from fam1 are: \(fam1.showMembersWithOccupation())")
print("\n")

fam1.initializeHierarchy(person: person0)
print("Ancestors for \(person6.fullName) are: \(fam1.showAncestors(from: person6))")
print("\n")
print("Cousins for \(person4.fullName) are \(fam1.showCousins(person: person4))")
print("\n")

if let dataFromJson = fam1.buildFromJson(data: jsonData) {
    print("\(dataFromJson.description)") //ok
}

/* --ok
if sameChildren(person1: person0, person2: person0_) {
    print("same children")
} else {
    print("errorr")
} */
