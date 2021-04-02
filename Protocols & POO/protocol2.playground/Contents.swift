import UIKit
import Foundation
//protocol composition

protocol Named{
    var name: String {get}
}

protocol Aged{
    var age: Int {get}
}

struct Person: Named, Aged{
    var name: String
    var age: Int
}

func wish(to celebrator: Named & Aged){
    print("Happy bday, \(celebrator.name), you're \(celebrator.age)!")
}

let bdayPerson = Person(name: "sergiu", age: 19)
wish(to: bdayPerson)

print("1")
