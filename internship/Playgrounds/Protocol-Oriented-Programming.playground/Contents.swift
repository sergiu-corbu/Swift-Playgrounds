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

