import UIKit

var x = 110

func foo() -> Int {
    return 10
}

x = foo()

var demo: String?

switch demo {
    case .none:
        break
    case .some(let value):
        print(value)
}


func weather(season: String!) -> Int {
    var temperature: Int
    if season == "winter"{
        temperature = -10
    } else {
        temperature = 0
    }
    return temperature
}

weather(season: nil)
/*
 func computeFullName(firstName: String?, lastName: String?) -> String {
 if firstName == nil || lastName == nil{
 return "none"
 }
 return firstName! + lastName!
 }
 */

/*
 func computeFullName(firstName: String?, lastName: String?) -> String {
 if let firstName = firstName {
 if let lastName = lastName {
 return firstName + lastName
 }
 }
 
 return "none"
 }
 */

/*
 func computeFullName(firstName: String?, lastName: String?) -> String {
 if let firstName = firstName, lastName != nil{
 
 return firstName + lastName!
 }
 
 return "none"
 }
 */

/*
 func computeFullName(firstName: String?, lastName: String?, isPolite: Bool) -> String {
 if let firstName = firstName, let lastName = lastName {
 if isPolite {
 return "Mr. " + firstName + lastName
 } else {
 return firstName + lastName
 }
 
 }
 return "none"
 }*/

/*
 func computeFullName(firstName: String?, lastName: String?, isPolite: Bool) -> String
 {
 guard let firstName = firstName, let lastName = lastName else {
 return "none"
 }
 if isPolite {
 return "Mr. " + firstName + lastName
 } else {
 return firstName + lastName
 }
 }*/

/*
 func computeFullName(firstName: String?, lastName: String?, isPolite: Bool) -> String
 {
 guard let firstName = firstName else {
 if let lastName = lastName {
 return lastName
 }
 return "none"
 }
 
 guard let lastName = lastName else {
 return firstName
 }
 
 if isPolite {
 return "Mr. " + firstName + lastName
 } else {
 return firstName + lastName
 }
 }
 */

/* !!! for later
 func computeFullName(firstName: String?, lastName: String?, isPolite: Bool) -> String {
 var result: String
 let array = [firstName, lastName].filter { (<#String?#>) -> Bool in
 <#code#>
 }
 result = [firstName, lastName]
 return result
 }
 */




//computeFullName(firstName: nil, lastName: "efra")


class Animal {
    var name: String
    var age: Int
    var description: String {
        get {
            if let existing = _description {
                return existing
            } else {
                return "\(name) is \(age) yrs old"
            }
        }
        set {
            self._description = newValue
        }
        
    }
    
    var _description: String?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func makeNoise(_ noise: String) -> String {
        return "\(name) makes \(noise)"
    }
    
}

var myAnimal = Animal(name: "Toby", age: 10)
print(myAnimal.makeNoise("woof"))
let toby = myAnimal
myAnimal.age = 70
print(toby.age)


class Owner {
    var familyName: String? = "ME"
    
}


class Pet: Animal {
    var owner: Owner?
    
    init(name: String, age: Int, owner: Owner? = nil) {
        self.owner = owner
        super.init(name: name, age: age)
    }
    override func makeNoise(_ noise: String) -> String {
        return "p....."
    }
    
    override var description: String {
        
        get {
            if let owner = owner {
                return super.description + " and its owner is \(owner.familyName) "
            } else {
                return super.description + " and has no owner "
            }
        }
       
        set {
            self._description = newValue
        }
        
    }
}

/*
 class Animal {
 var name: String
 var age: Int
 
 init(name: String, age: Int) {
 self.name = name
 self.age = age
 }
 
 func makeNoise(_ noise: String) -> String {
 return "\(name) makes \(noise)"
 }
 
 }
 
 var myAnimal = Animal(name: "Toby", age: 10)
 print(myAnimal.makeNoise("woof"))
 let toby = myAnimal
 myAnimal.age = 70
 print(toby.age)
 
 var myAnimals = [myAnimal, Animal(name: "mars", age: 1)]
 myAnimals.append(Animal(name: "kitty", age: 2))
 let copy = myAnimals
 myAnimals.first!.age = 33
 print(copy.first!.age)
 */


var number: Int = 10
number = Int("10") ?? -1

let me = Owner()
let t = Pet(name: "me1", age: 11)
t.owner = me
print(t.owner?.familyName)
//t.description = "ad"

let nameOfT = t.owner?.familyName?.first ?? "d"

/*
 func petAnimal(animal: Animal) {
 if let pet = animal as? Pet {
 print("\(String(describing: pet.owner))")
 } else {
 print("this is not a pet")
 }
 }
 */

func petAnimal(animal: Animal) {
    if animal is Pet {
        print("this is a pet")
    } else {
        print("this is not a pet")
    }
}


petAnimal(animal: t)

print(myAnimal.description)

myAnimal.description = "my descr"
print(myAnimal.description)


