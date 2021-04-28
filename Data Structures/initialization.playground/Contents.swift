import UIKit

/* initialization is the process of preparing an instance of a class/structure/enum for use */

struct Fahrenheit{
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("the default temperature is \(f.temperature)")

struct Color{
    let red, green, blue : Double
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double){
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfgrey = Color(white: 0.5)

//optional property types

class SurveyQuestion{
    var text: String
    var response: String? //it might not get an answer
    init(text: String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}

let cheeseQ = SurveyQuestion(text: "Do you like cheese?")
cheeseQ.ask()
cheeseQ.response = "Yes"

class Vehicle{
    var numberofWheels = 0
    var description: String{
        return "\(numberofWheels) wheel(s)"
    }
}

class Bicycle: Vehicle{
    override init() {
        super.init()  // for to initialization is made properly
        numberofWheels = 2
    }
}

class Hoverboard: Vehicle{
    var color: String
    init(color: String){
        self.color = color
    }
    override var description: String{
        return "\(super.description) is a beautiful \(color)"
    }
}

//other example

class Food{
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name: "[Unnamed")
    }
}

class RecipeIngredient: Food{
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){
        self.init(name: name, quantity: 1)
    }
}


let item = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "bacon")
let sixeggs = RecipeIngredient(name: "Eggs", quantity: 6)


class ShoppingListItem: RecipeIngredient{
    var purchased = false
    var description: String{
        var output = "\(quantity) x \(name)"
        output += purchased ? "yes" : "no"
        return output
    }
}

var breakfastList = [ShoppingListItem(), ShoppingListItem(name: "bacon"), ShoppingListItem(name: "eggs", quantity: 6)]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true

for item in breakfastList{
    print(item.description)
}

//failable initializations

struct Animal{
    let species: String
    init?(species: String){
        if species.isEmpty { return nil}
        self.species = species
    }
}

let animal = Animal(species: "Giraffe")

if let giraffe = animal{
    print("an animal was initialized with a species of \(giraffe.species)")
    
let an = Animal(species: "")
    if an == nil{
        print("error")
    }
}

