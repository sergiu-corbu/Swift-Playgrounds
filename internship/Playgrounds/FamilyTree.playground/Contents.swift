import Foundation

let jsonString = """
{"firstName":"Sergio","lastName":"Conti", "age": 10, "sex": .male, "descendants": [
    "firstName":"Matthew","lastName":"Giko", "age": 30, "sex": .male, "descendants": [], "occupation": .doctor
], "occupation": nil}
"""

let jsonData = Data(jsonString.utf8) //convert json string to object


enum EngineerType {
    case software
    case automotive
    case systemAdmin
    case aeroSpatial
}

enum Sex {
    case male
    case female
}

enum Occupation {
    
    case doctor
    case student
    case engineer(type: EngineerType)
    case retired
    case athlete
}

class Queue<Person> {
    var arr = [Person]()
    
    func enqueue(_ val: Person) {
        arr.append(val)
    }
    
    func dequeue() -> Person? {
        if arr.isEmpty {
            return nil
        } else {
            return arr.remove(at: 0)
        }
    }
    
    func isEmpty() -> Bool {
        if arr.count == 0 {
            return true
        }
        return false
    }
}

class Person { //}: Decodable { // eroare pt ca occupation is optional

    var firstName: String
    var lastName: String
    var age: Int
    var sex: Sex
    var descendants: [Person]
    var occupation: Occupation?
    var isVisited = false
    var spouse: Person?
    
    init(firstName: String, lastName: String, age: Int, sex: Sex, descendants: [Person], occupation: Occupation?, spouse: Person?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.sex = sex
        self.descendants = descendants
        self.occupation = occupation
        self.spouse = spouse
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
        let baby = Person(firstName: firstName, lastName: self.lastName, age: 0, sex: sex, descendants: [], occupation: nil, spouse: nil)
        descendants.append(baby)
    }
    
}

class FamilyTree {//: Decodable {
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
        return result
    }
    
    func showAncestors(to dest: Person) -> [String] { //////to doooooo
        var result: [String] = [firstAncestor.fullName]
        let queue = Queue<Person>()
        
        queue.enqueue(firstAncestor)
        
        while !queue.isEmpty() {
            guard let nextDescendant = queue.dequeue() else { break }
            
            for descendant in nextDescendant.descendants {
                if descendant.fullName == dest.fullName {
                    result.append(dest.fullName)
    
                    break
                } else if descendant.isVisited == false {
                    result.append(descendant.fullName)
                    queue.enqueue(descendant)
                }
                queue.dequeue()
                result.remove(at: 0)
            }
            nextDescendant.isVisited = true
        }
        return result
    }
    
    func showMembersWithOccupation() -> [String] {
        var result = (firstAncestor.occupation != nil ? ["Members with occupation are: \(firstAncestor.fullName), "] : ["Members with occupation are: "])
        firstAncestor.isVisited = true
        for descendant in firstAncestor.descendants {
            if !descendant.isVisited && descendant.occupation != nil {
                result += showMembers(person: descendant)
            }
        }
        return result
    }
    
    func searchPerson(person: Person) -> String {
        let allMembers = showMembers(person: firstAncestor)
    
        var result: String = "The person you are looking for is "
        for member in allMembers {
            if member.contains(person.fullName) {
                result += member
                break
            }
        }
        return result
    }
    
   /* func buildFromJson(data: Data) -> Person? {
        var result: Person?
        do {
            result = try JSONDecoder().decode(Person.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return result
    } */
}


var person2 = Person(firstName: "Sergiu", lastName: "Corbu", age: 20, sex: .male, descendants: [], occupation: .engineer(type: .software), spouse: nil)
var person4 = Person(firstName: "Ana", lastName: "Moldovan", age: 8, sex: .female, descendants: [], occupation: nil, spouse: nil)
var person1 = Person(firstName: "Jim", lastName: "Mac", age: 19, sex: .male, descendants: [person4], occupation: .athlete, spouse: nil)
var person3 = Person(firstName: "Jack", lastName: "Wills", age: 40, sex: .male, descendants: [person4], occupation: nil, spouse: nil)
var person0 = Person(firstName: "Tom", lastName: "Green", age: 43, sex: .male, descendants: [person1, person2, person3], occupation: .doctor, spouse: nil)

var fam1 = FamilyTree(firstAncestor: person0)

//print(person1.adultSons)
person2.addBaby(firstName: "Cristina", sex: .female)
//print(person0.descendants)
//print(fam1.showMembersWithOccupation())
//print(fam1.searchPerson(person: person3))
//print(fam1.showMembers(person: person0))
print(fam1.showAncestors(to: person4))

//working json conversion
/*
 let jsonString = """

 {"firstName":"Sergio","lastName":"Conti", "age": 10}

 """

 let jsonData = Data(jsonString.utf8) //convert json string to object

 class Person: Decodable {
     var firstName: String
     var lastName: String
     var age: Int
     init(firstName: String, lastName: String, age: Int) {
         self.firstName = firstName
         self.lastName = lastName
         self.age = age
     }
     
     var fullName: String {
         return "\(firstName) \(lastName)"
     }
 }

 class FamilyTree {
     var firstAncestor: Person
     
     init(firstAncestor: Person) {
         self.firstAncestor = firstAncestor
     }
 }

 func parseJson(data: Data) -> Person? {
     var result: Person?
     do {
         result = try JSONDecoder().decode(Person.self, from: data)
     } catch {
         print("Error: \(error.localizedDescription)")
     }
     return result
 }

 if let person = parseJson(data: jsonData) {
     print("\(person.age)")
 }

 */
