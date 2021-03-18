 import UIKit
 import Foundation
 
 enum Type {
    case Software
    case Automotive
    case SystemAdmin
    case AeroSpatial
 }
 
 enum Sex {
    case Male
    case Female
 }
 
 enum Occupation {
    case Doctor
    case Student
    case Engineer(type: Type)
    case Retired
    case Athlete
 }
 
class Person {

    var firstName: String
    var lastName: String
    var age: Int
    var sex: Sex
    var descendants: [Person]
    var occupation: Occupation?
    
    init(_firstName: String, _lastName: String, _age: Int, _sex: Sex, _descendants: [Person], _occupation: Occupation) {
        self.firstName = _firstName
        self.lastName = _lastName
        self.age = _age
        self.sex = _sex
        self.descendants = _descendants
        self.occupation = _occupation
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var description: String {
        if descendants.count > 0{
            return "\(firstName.capitalized) is a \(age) year old \(sex) \(occupation) and has \(descendants.count) sons."
        }
        else{
            return "\(firstName.capitalized) is a \(age) year old \(sex) \(occupation) and doesn't have any sons."
        }
    }
    
    var adultSons: [String] {
        return descendants.filter({ $0.age >= 18}).map({$0.firstName})
    }
    
    func addBaby(firstName: String, sex: Sex){
        let baby = Person(_firstName: "", _lastName: "", _age: 0, _sex: Sex.Female, _descendants: [], _occupation: <#Occupation#>)
        baby.firstName = firstName
        baby.sex = sex
        baby.lastName = lastName
        descendants.append(baby)
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
    
    /*func findIndividual(firstName: String) -> String {
        let members = familyMembers()
        print("Enter the person's first name or last name: ")
        let data = readLine()
        for member in members{
            if member.contains(data!){
                return member
            }
        }
        return "the person does not exist"
    }*/
    func showDescendants(person: Person) -> [Person] {
        var result: [Person] = []
        for member in 0..<person.descendants.count{
            result.append(person.descendants[member])
        }
        return result
    }
    /*func shwoMembersWithOccupation() -> [String] {
        var result = firstAncestor.descendants.filter({$0.occupation?.rawValue != ""}).map({$0.firstName})
        return result
    }*/
 }
 
 
 extension Person {
    
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


 var person0 = Person(_firstName: "Jim", _lastName: "Mac", _age: 19, _sex: .Male, _descendants: [], _occupation: .Athlete)
 
 var person1 = Person(_firstName: "Tom", _lastName: "Green", _age: 43, _sex: .Male, _descendants: [person0], _occupation: .Athlete)
 
 var fam1 = FamilyTree(_firstAncestor: person1)
 
 //print(person1.description)

 print(fam1.familyMembers())
