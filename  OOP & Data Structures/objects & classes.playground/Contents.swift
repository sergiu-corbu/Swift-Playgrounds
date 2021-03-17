import UIKit
//structs

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//classes
/*class Car{
    var tires = 4
    var make: String?
    var model: String?
    var currentspeed: Double = 0
    func drive(speedIncrease: Double){
        currentspeed += speedIncrease * 2
    }
}


let tesla = Car()
tesla.model = "model 3"

func somefunc(vehicle: Car){
    vehicle.model = "Cheese"
}

print(tesla.model)

somefunc(vehicle: tesla) //pass by refference

print(tesla.model)

*/

//inheritance oop

class Car{
    var tires = 4
    var make: String?
    var model: String?
    var currentspeed: Double = 0
    
    init(){
        
    }
    
    
    
    func drive(speedIncrease: Double){
        currentspeed += speedIncrease * 2
    }
}

class sportscar: Car{
    override init() {
        super.init()
        make = "Tesla"
        model = "series 3"
    }
    
    override func drive(speedIncrease: Double) {
        currentspeed += speedIncrease * 3
    }
}

//polymorphism

class shape{
    var area: Double?
    func calcarea(x: Double, y: Double){
        
    }
}

class triangle: shape{
    override func calcarea(x: Double, y: Double) {
        area = (x*y)/2
    }
}

class rectangle: shape{
    override func calcarea(x: Double, y: Double) {
        //other area
    }
}
