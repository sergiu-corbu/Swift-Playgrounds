import UIKit
//avoids writing too much code

func printHelp() {
    let message = " welcome to my app"
    
    print(message)
}

//accpting perameters
func square(number: Int) {
    //do something
}

//parameter labels
//external and internal
func sayHello(to name: String) {
    print("Hello, \(name)")
}

sayHello(to: "ME")

//omitting parameter labels _

func greet(_ person: String) {
    print("Hello, \(person)")
}

greet("ME")

//variadic functions: multiple parameters of the same type

func Square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

Square(numbers: 1,2,4)

//throwing functions
//describe errors in enum

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

//inout parameters
//all parameters passed are constants
//inout will allow changes

func doubleInPlace(number: inout Int) {
    number *= 2
}

var number = 12
doubleInPlace(number: &number)
print(number)
