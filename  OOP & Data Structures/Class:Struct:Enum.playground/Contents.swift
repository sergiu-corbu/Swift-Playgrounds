import UIKit

//struct & class

struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interm: Bool = false
    var frameRate: Double = 0.0
    var name: String?
}

//class inheritance

class Car{
    var tires = 4
    var make: String?
    var model: String?
    var speed: Double = 0
    
    init(){
        
    }
    
    func drive(speedIncrease: Double){
        speed += speedIncrease * 2
    }
}

class SportsCar: Car{
    override init(){
        super.init()
        make = "Tesla"
        model = "Model 3 Performance"
    }
    override func drive(speedIncrease: Double) {
        speed = speedIncrease * 2.5
    }
}

let audi = Car()
audi.drive(speedIncrease: 10)
let tesla = SportsCar()
tesla.drive(speedIncrease: 10)

//print(audi.speed)
//print(tesla.speed)

//polymorphism

class Shape{
    var area: Double?
    func calculateArea(x: Double, y: Double){
        area = x * y
    }
}

class triangle: Shape{
    override func calculateArea(x: Double, y: Double) {
        //other formula
        area = 2 * x + 2 * y
    }
}

/* when defining a class:
 - add ? to variables & constants
 - assign values
 - write your own init() -  best option
 */

class Person{
    var clothes: String
    var shoes: String
    init(clothes: String, shoes: String){
        self.clothes = clothes
        self.shoes = shoes
    }
}


//static properties and methods
struct TheGame{
    static var song = "doc2.5" // will remain the same
    var age: Int
    var name: String
}

let fan = TheGame(age: 31, name: "Lloyd")

/*access control:
 - public ( everyone can read/write the property)
 - internal (only in swift code)
 - fileprivate (rare)
 - private (only available in the swift file/method)
*/
//enums

enum name{
    case one
    case two
}

let enumeration: name = .one

enum Beverage: CaseIterable{
    case coffee
    case tea
    case juice
    case sparkling
}


