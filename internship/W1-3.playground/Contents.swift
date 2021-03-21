var flower: Any = "trandafir"
flower = 28
var sunflower: AnyObject = "trandafir" as AnyObject

import UIKit
var flower2: NSString = "sunflower"

class Flower {
    var color: String
    
    init() {
        self.color = "red"
    }
}

class GardenFlower: Flower {
    
}

var someObj: AnyObject = Flower()
someObj = flower2
print(type(of: someObj))

func takeGradenFlower(flower: AnyObject) {
    guard let casted = flower as? Flower else {
        print("please enter a flower")
        return
    }
    print(type(of: casted))
}

takeGradenFlower(flower: GardenFlower())

let gardenFlower = flower2 as? GardenFlower

protocol Flyable {
    var speed: Int {get set}
    func fly()
}

protocol Swimmable {
    var endurance: Int {get set}
    func swim()
}

extension Swimmable {
    func swim() {
        print("Average swimming")
    }
}

protocol UnderWaterSwimmable: Swimmable {
    var airSupply: Float {get set}
    func swimUnderWater()
}

protocol SuperHero {
    
}

struct Superman: SuperHero, Flyable, Swimmable {
    var speed: Int = 10
    
    func fly() {
        print("Superman flies very fast!")
    }
    
    var endurance: Int = 100
    
}


struct Aquaman: SuperHero, UnderWaterSwimmable {
    var endurance: Int = 23
    
  
    var airSupply: Float = 9.99
    
    func swimUnderWater() {
        print("Aquaman is under water!")
    }
}

struct HumanSwimmer: SuperHero, Swimmable {
    var endurance: Int = 1
    
    func swim() {
        print("Human swims very slow!")
    }
}

var superheroes: [SuperHero] = [Superman(), Aquaman(), HumanSwimmer()]
for hero in superheroes {
    if let flyingHero = hero as? Flyable {
        flyingHero.fly()
    } else if let swimmingHero = hero as? Swimmable {
        swimmingHero.swim()
    } else if let underWaterHero = hero as? UnderWaterSwimmable {
        underWaterHero.swimUnderWater()
    }
}




