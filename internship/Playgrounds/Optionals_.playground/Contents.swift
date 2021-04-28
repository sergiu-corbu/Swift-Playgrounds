import UIKit

//Optionals need to be unwrapped when used
// do the unwrap with if let or guard let

var age: Int? = nil

age = 38

//unwrapping
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name")
}


//guard unwrap
// main advantage: the unwrapped optional remains usable after guard code
// the rest of the function after guard is the happy part, no errors

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("you didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped) !")
}

//force unwrapping
//when you know for sure it is a value

let str = "5"
let num = Int(str)! // num = non optional int

//implicitly unwrapped optionals
let afe: Int! = nil // now it will crash if not provided a value

//nil coalescing
//returns a default value, and result won't be optional
func username(for id: Int) -> String? {
    if id == 1 {
        return " Your Name"
    } else {
        return nil
    }
}

let user = username(for: 1) ?? "Annonymous"



//optional chaining
// a.b.c and b is optional, -> a.b?.c swift checks if b has value, if nil return nil. if has, value will be unwrapped

let names = ["John", "Paul", "George", "Tom"]
let firstFromNames = names.first?.uppercased() //there might be an empty array

//optional try

//first method

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("you can't use that password")
}

// ? method
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("Not good")
}


//failable initializers
//init?

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//typecasting as? converts a type to another

class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("Woof")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

/*
for pet in pets {
    guard let dog = pet as? Dog else {
       return "Not a dog"
    }
    dog.makeNoise()
}
*/
