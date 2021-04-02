import UIKit

//optionals let developers which data could be nil and which data is guaranteed to not be nill
//just put the ? sign
/*
struct Person{
    let firstname: String
    let middlename: String?
    let lastname: String
    
    func printname(){
        let middle = middlename ?? "" //if middlename is nill, replace with an empty string
        print("\(firstname) \(middle) \(lastname)")
    }
}

var person = Person(firstname: "Jen", middlename: nil, lastname: "Thompson")
var person2 = Person(firstname: "Jen", middlename: "Leroy", lastname: "Thompson")

person.printname()
person2.printname()
 
*/
class Person{
    let firstname: String
    let middlename: String?
    let lastname: String
    let spouse: Person?
    
    init(firstname: String, middlename:String?, lastname: String, spouse:Person?){
        self.firstname = firstname
        self.middlename = middlename
        self.lastname = lastname
        self.spouse = spouse
        
    }
    
    func printname() -> String{
        let middle = middlename ?? "" //if middlename is nill, replace with an empty string
        return "\(firstname) \(middle) \(lastname)"
    }
}

let person = Person(firstname: "Anne", middlename: "Joe", lastname: "Slice", spouse: nil)

if let spousename = person.spouse?.printname(){ //if is not nil
    print(spousename)
}
else{
    print("\(person.firstname) does not have a spouse")
}
