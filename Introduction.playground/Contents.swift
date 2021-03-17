import UIKit

//comment, /* multi line comment*/

print("message")

//variable
var x = 10
var y: Int = 1
var message: String = "this is an explicit type declaration"

//string interpolation
let name = "sergiu"
var printname: String = "Hello, \(name)!"

//add a string to the end of another
printname.append("And i like playing football")


//constant no future changes allowed
let c = 1
let j = 3.9
let j1 = Int(j)


//preffered data type
var num:Int = 11
var str:String = "Hi"

//math fuctions
let sqroot: Double = sqrt(64)
let power = pow(2,2)



// if statements
let a = 6

if a < 4{
    print("only if less than 4")
}
else if a < 8 {
    print("ok")
}

//opreators: && || == !

// switch
var s: Character = "2"

switch s{
case "a":
    print("is an A")
case "b":
    print("is a B")
case "c", "d":
    print("is a c or a d")
    
default:
    print("some fallback")
}

// loops

for i in 1...4{
    print(i)
    
}

// from a to b not included (<)
for _ in 1..<5 {
    continue
}

var counter = 0

while counter > 0{
    print("aa")
    counter -= 1
}
/*
repeat{
    counter += 1
} while counter > 0
*/


