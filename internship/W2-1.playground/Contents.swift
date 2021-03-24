import UIKit


var sum: (Int, Int) -> Int = { element1, element2 in
    return element1 + element2
}
// a computed variable that takes a closure and returns an int

class Calculator {
    var difference: ((Int, Int) -> Int)?
    
    func setDifference(function: @escaping (Int,Int) -> Int ) {
        self.difference = function
    }
}

let calculator = Calculator()

calculator.difference = {element1, element2 in
    return element1 - element2
}

let result: Int = {element1, element2 in
    return element1 - element2
}(5,3)


let result2 = {(element1: Int, element2: Int) in
    return element1 - element2
}

calculator.difference = nil
let result3 = calculator.difference?(4,1)

calculator.setDifference { (element1, element2) -> Int in
    return element1 - 2 * element2
}

let result4 = calculator.difference?(8,2)

func myDifference(element1: Int, element2: Int) -> Int {
    return element1 - 3 * element2
}
func myDifference2(_ element1: Int, _ element2: Int) -> Int {
    return element1 - 3 * element2
}
calculator.difference = myDifference(element1:element2:)
calculator.difference = myDifference2


class Parent {
    var name: String = "default"
}

struct ParentAsValueType {
    var name: String = "default_fromValueType"
}

var parentA = Parent()
let printName = {
    print(parentA.name)
}

parentA.name = "A_sth_kun"
printName()


var parentB : Int = 12
var printName2 = {(number: Int) in
    print(number + parentB)
}

parentB = 3
printName2(1)


//class A {
//    var b: B!
//
//    deinit {
//        print("deinit A")
//    }
//}
//
//class B{
//    weak var a: A!
//
//    deinit {
//        print("deinit B")
//    }
//}
//
//var clA: A! = A()
//var clB: B! = B()
//
//clA.b = clB
//clB.a = clA
//
//clA = nil
//clB = nil

class A {
    var name: String = "clasaA"
    var b: B!
    
    deinit {
        print("deinit A")
    }
}

class B{
    var callback: ((String) -> Void)!
    
    func setCallback(function: @escaping (String) -> Void){
        self.callback = function
    }
    
    deinit {
        print("deinit B")
    }
}


var clA: A! = A()
var clB: B! = B()
clA.b = clB


clB.setCallback {[weak clA]value in
    print("debug")
    let a = clA
    print(value + a!.name)
}


clB.callback("1212")

clA = nil
clB = nil






