import Foundation

//MARK: Intro
/*
 - closures enable defining a group of code statements that can be called as one unit
 - unlike functions, closures can be defined inline
 - it accepts input and output
 - can be stored as properties and local variables
 - can be passed as arguments to function
 - can capture and store references
 - like a function that can be assigned to a variable
 
 */

struct IntToStringConvertor {
    // a closure property that takes an Int as input
    var body: (Int) -> String
}

//a closure defined as an inline variable with takes no input and produces an Int as output
let intProvider: () -> Int = { return 1 }

//a closure function argument that has no input or output
func performOperation(then closure: () -> Void) {
    //code here
}

extension String {
    func transformWords(using closure: (Substring) -> String) -> String {
        let words = split(separator: " ")
        var results = [String]()
        
        for word in words {
            let transformed = closure(word)
            results.append(transformed)
        }
        return results.joined(separator: " ")
    }
}

// info v2
// - closures are variables that holds code

//call
let string = "Hello world you are very polluted".transformWords(using: { word in
                                                                    return word.lowercased() })
// - the "in" keyword is used to name the arguments that the closure accepts
// - an optimized solution would be replacing "word in" with $0

//the code will be:
let string1 = "Hello world you are beautiful".transformWords{ $0.lowercased()}


let driving = {
   print("I m driving")
}

driving()

//accepting parameters
//diference between closures and functions: closures don't take parameters labels
let drive = { (place: String) in
    print("I' m going to \(place) in my car")
}

drive("London")

//returning values from closure

let driveWithReturn = { (place: String)  -> String in
   return "I' m going to \(place) in my car"
}

//closures as parameters
//a closure is specified as () -> Void
func travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}

travel(action: driving)


//trailing closing syntax
//pass it directly, no through parameter

func Travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}

Travel {
    print("I'm driving in my car")
}


//using closures as parameters when they accept parameters
func travel2(action: (String) -> Void) {
    print("i m getting ready to go")
    action("London")
    print("I arrived")
}

travel2 { (place: String) in
    print("I m going to \(place) in my car")
}

func iTrave(action: (String) -> String) {
    print("I travel")
    let description = action("paris")
    print(description)
    print("I arrived")
}

iTrave { (place: String) -> String in
    return "I m going to \(place) in my car"
}/*
//using closures as parameters when they return values
func travelFunc(action: (String) -> String) {
    print("I' m getting ready to go")
    let description = action("London")
    print(description)
    print("I arrived")
}

travelFunc { (place: String) -> String in
    return "I m going to \(place) in my car"
}


//shorthand parameter names
travelFunc { place in
    return "I m going to \(place) in my car"
}

//closures with multiple parameters
func travelSpeed(action: (String, Int) -> String) {
    print("I' m getting ready to go")
    let description = action("London", 60)
    print(description)
    print("I arrived")
}

travelSpeed {
    "I m going to \($0) at \($1) miles per hour"
}


//returning functions from functions

func travelReturn () -> (String) -> Void {
    return {
        print("I m going to \($0)")
    }
}

let result = travelReturn()
result("london")


//capturing values
func travelReturn1 () -> (String) -> Void {
    var counter = 1
    return {
        print("I m going to \($0)")
        counter += 1
    }
}

let result1 = travelReturn1()
result1("londonn")
result1("londonn")
result1("londonn")
*/
