import Foundation

//MARK: Intro
/*
  - protocols allows to group similar methods, functions and properties.
  - objects in swift can conform to multiple protocols
  - the code becomes more moular
  - like using blocks of functionality
 */

protocol Bird {
    var name: String {get}
    var canFly: Bool {get}
}

extension Bird {
    var canFly: Bool { self is Flyable }
}
// - extension of bird sets the default behavior to canFly to return true whenever the type conforms to the flyable protocol. Any flyable bird no longer needs to explicitly declare it canFly


protocol Flyable {
    var airspeedVelocity: Double {get}
}

struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airspeedVelocity: Double {
        3 * flappyFrequency * flappyAmplitude
    }
}


struct Penguin: Bird {
    let name: String
    let canFly = false
}

struct SwiftBird: Bird, Flyable {
    var name: String { "Swift \(version)"}
    let canFly = true
    let version: Double
    private var speedFactor = 1000.0
    
    init(version: Double) {
        self.version = version
    }
    
    var airspeedVelocity: Double {
        version * speedFactor
    }
    
}

// - a penguin is a bird, but it can fly
// - using protocols, you can define functional components and have any relevant object conform to them


// - extending protocols with default implementation
// - protocol extensions allow you to define a protocol's default behavior

//MARK: -enums in swift are powerful, can conform to protocols as well

enum UnladenSwallow: Bird1, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch  self {
            case .african:
                return "African"
            case .european:
                return "European"
            case .unknown:
                return "What do you mean?"
        }
    }
    
    var airspeedVelocity: Double {
        switch self {
            case .african:
                return 10.0
            case .european:
                return 9.9
            case .unknown:
                fatalError("You are thrown from the bridge of death!")
        }
    }
    
}


//MARK: - overriding default behavior

extension UnladenSwallow {
    var canFly: Bool {
        self != .unknown //now only .african and .european will return true for canFly
    }
}



//MARK: - extending protocols
// - conform protocols to other protocols from Swift standard library

// - conforming to CustomStringConvertible means the type needs to have a "description" so it will convert to a string automatically when needed, it will only be associated with the type of "declared_type"

protocol Bird1: CustomStringConvertible {
    var name: String { get }
    var canFly: Bool { get }
}

extension CustomStringConvertible where Self: Bird1 {
    var description: String {
        canFly ? "I can fly" : "Guess i ll just walk"
    }
}

//UnladenSwallow.european

//MARK: effects on the swift standard library

let numbers = [10, 20, 30, 40, 50, 60]
let slice = numbers[1...3]
let reversedSlice = slice.reversed()

let answer = reversedSlice.map { $0 * 10 }
print(answer)

/* interesting facts:
 - slice as a type is ArraySlice<Int>
 - reversedSlice is ReversedCollection<ArraySlice<Int>>
 - map is an extension to the Sequence protocol, which all Collection types conform to.
 */


//adding a comparison for the bird

class Motorcycle {
    
    var name: String
    var speed: Double
    
    init(name: String) {
        self.name = name
        self.speed = 200.0
    }
}


//now we need a common protocol for racing

protocol Racer {
    var speed: Double { get }
}

// then conform everything to racer so that all existing types can be raced.
extension FlappyBird: Racer {
    var speed: Double {
        airspeedVelocity
    }
}

extension SwiftBird: Racer {
    var speed: Double {
        airspeedVelocity
    }
}

extension Penguin: Racer {
    var speed: Double {
        45
    }
}

extension UnladenSwallow: Racer {
    var speed: Double {
        canFly ? airspeedVelocity : 0.0
    }
}

extension Motorcycle: Racer {}

let racers : [Racer] = [UnladenSwallow.african, UnladenSwallow.european, UnladenSwallow.unknown, Penguin(name: "King penguin"), SwiftBird(version: 5.1), FlappyBird(name: "Felipee", flappyAmplitude: 3.0, flappyFrequency: 20.0), Motorcycle(name: "Giacomo")]

//get the top speed
func topSpeed(of racers: [Racer]) -> Double {
    racers.max(by: {$0.speed < $1.speed})?.speed ?? 0.0
}

topSpeed(of: racers)


//making it generic
//if we want to find the top speed for a subset
//new top speed func

func topSpeed_<RacersType: Sequence>(of racers: RacersType) -> Double where RacersType.Iterator.Element == Racer {
    racers.max(by: {$0.speed < $1.speed })?.speed ?? 0.0
}

//RacersType is the generic type, so the input can be any type that conforms to the Sequence protocol
// where clause specifies that the Element type of the Sequence must conform to Racer protocol to use this function

topSpeed_(of: racers[1...3])

//making it more swifty

extension Sequence where Iterator.Element == Racer {
    func topSpeed() -> Double {
        self.max(by: { $0.speed < $1.speed })?.speed ?? 0.0
    }
}

racers[1...3].topSpeed()


//MARK: Mutating functions
// what if i want to change something at an object?

protocol Cheat {
    mutating func boost(_ power: Double)
}

extension SwiftBird: Cheat {
    mutating func boost(_ power: Double) {
        speedFactor += power
    }
} //mutating for the struct to know one of its values will change

var swiftBird = SwiftBird(version: 5.0)
swiftBird.boost(3.0)
swiftBird.airspeedVelocity
swiftBird.boost(3.0)
swiftBird.airspeedVelocity
