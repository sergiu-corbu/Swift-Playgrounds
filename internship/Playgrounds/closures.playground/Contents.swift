import UIKit

// basic closure

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



