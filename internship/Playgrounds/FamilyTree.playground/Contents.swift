import Foundation

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

class Person {
    
    var firstName: String
    var lastName: String
    var age: Int
    var sex: Sex
    var descendants: [Person]
    var occupation: Occupation?
    
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
        let baby = Person(firstName: firstName, lastName: self.lastName, age: 0, sex: sex, descendants: [], occupation: occupation)
        descendants.append(baby)
    }
    
    func search(value: String) -> Person? {
        if value == self.firstName || value == self.lastName {
            return self
        }
        
        for member in descendants {
            if let found = member.search(value: value) {
                return found
            }
        }
        return nil
    }
    
}

class FamilyTree {
    var firstAncestor: Person
    
    init(_firstAncestor: Person) {
        self.firstAncestor = _firstAncestor
    }
    
    func familyMembers() -> [String] {
        var members: [String] = [firstAncestor.fullName]
        
        for member in 0..<firstAncestor.descendants.count {
            members.append(firstAncestor.descendants[member].fullName)
        }
        //  members.append(firstAncestor.descendants.map({$0.fu}))
        return members
    }
    
    func showDescendants() -> String {
        var result = "Descendants for \(firstAncestor.fullName): "
        if !firstAncestor.descendants.isEmpty {
            result += "{ " + firstAncestor.descendants.map{($0.fullName)}.joined(separator: ", ") + " }"
        }
        return result
    }
    /*
     func shwoMembersWithOccupation() -> [String] {
     var result = firstAncestor.descendants.filter({$0.occupation?.rawValue != ""}).map({$0.firstName})
     return result
     }*/
}

var person0 = Person(firstName: "Jim", lastName: "Mac", age: 19, sex: .male, descendants: [], occupation: .athlete)

var person1 = Person(firstName: "Tom", lastName: "Green", age: 43, sex: .male, descendants: [person0], occupation: .doctor)

var fam1 = FamilyTree(_firstAncestor: person1)

//print(person1.adultSons)
// print(fam1.familyMembers())

let search = person1.search(value: "Jim")
//print(search)

person0.addBaby(firstName: "mia", sex: .female)
//print(person0.descendants)
//print(fam1.familyMembers())
print(fam1.showDescendants())

