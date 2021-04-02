import UIKit
import Foundation

//protocol syntax
protocol SomeProtocol{
    //code here
}

//property requirements
/*protocol SomeProtocol1{
    var mustBeSettable: Int {get get}
    var doesNotNeedToBeSettable: Int {get}
}
 */
//-------------

protocol FullyNamed {
    var fullname: String{get}
}

struct Person: FullyNamed{
    var fullname: String
}

let john = Person(fullname: "John Appleseed")
//john.fullname is "John Appleseed"
print(john.fullname)

// more complex class for the same FullyNamed protocol

class Starship: FullyNamed{
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }
    
    var fullname: String{
        return (prefix != nil ? prefix! + " ": "") + name
    }
}

var ncc1071 = Starship(name: "enterprise", prefix: "USS")
//ncc1071.fullname is "USS Enterprise"


//method requirements

protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongrunetialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 12430.1
    let a = 3340.9
    let c = 2341.3
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongrunetialGenerator()
print("here's a random number: \(generator.random())")

//mutating methods

protocol Toggable {
    mutating func toggle()
}

enum OnOffSwitch: Toggable{
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .on
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
//lightswitch is = to .on


//initializer requirements

protocol someProtocol{
    init(someParameter: Int)
}

class SomeClass: SomeProtocol{
    required init(someParameter: Int){
    //....
    }
}

//protocols as types
class Dice{
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongrunetialGenerator())
for _ in 1...5{
    print("Random dice roll is \(d6.roll())")
}

//delegation
//is a design patter that enables a class or a structure to hand off (or delegate) some of its responsabilities to an instance of another type.

protocol DiceGame{
    var dice: Dice{get}
    func play()
}

protocol DiceGameDelegate: AnyObject{
    func gameStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameEnd(_ game: DiceGame)
}


class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongrunetialGenerator())
    var square = 0
    var board: [Int]
    init(){
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] += 8; board[06] += 11; board[09] += 9; board[10] += 2;
    }
    
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameStart(self)
        gameLoop: while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll{
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameEnd(self)
    }
}

//adding protocol conformance with an Extension
protocol TextRepresentable{
    var textualDescription: String{get}
}

extension Dice: TextRepresentable{
    var textualDescription: String{
        return "A \(sides) - sided dice"
    }
}


