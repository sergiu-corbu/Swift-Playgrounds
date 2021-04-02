import UIKit
import Foundation

//failable initializers / if the args of a calss are invalid, the init returns nil

class Dog{
    let name: String
    let license: Int
    init?(name: String, license: Int){
        if name.isEmpty { return nil }
        if license <= 0 { return nil }
        self.name = name
        self.license = license
    }
}

//property initialization

//method 1
class wholeName{
    let first = "matt"
    let last = "duhhigh"
//    method1
    lazy var wholename = self.first + " " + self.last

    //method 2
    var wholename1: String{
        return self.first + " " + self.last
    }

}

//subscripts ( an instance method called in a special way
struct Digit{
    var number: Int
    init(_ n: Int){
        self.number = n
    }
    subscript(ix: Int)-> Int{
        get{
            let s = String(self.number)
            return Int(String(s[s.index(s.startIndex, offsetBy: ix)]))!
        }
    }
}
var d = Digit(1234)
let aDigit = d[1]

//nested object types
class Animal{
    struct Noise{
        static var noise = "woof"
    }
    func Bark(){
        print(Animal.Noise.noise)
    }
}
