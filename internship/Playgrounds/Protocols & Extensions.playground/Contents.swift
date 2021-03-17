import UIKit
import Foundation

protocol Description{
    var descr: String { get }
    
    mutating func adjust()
}
/*
the mutating keyword is used for methods that will 
*/
class Property: Description{
    var descr: String = "Property located in a central area."
    
    var rent: Int = 400
    func adjust() {
        descr += " Now listed on Storia"
    }
}

var loc1 = Property()

loc1.adjust()
//print(loc1.descr)

struct OtherProperty: Description{
    var descr: String = " This is a luxury residence for rent"
    
    mutating func adjust() {
        descr += " Now for sale!"
    }
}

var loc2 = OtherProperty()
loc2.adjust()
print(loc2.descr)


