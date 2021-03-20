import UIKit

protocol Bird {
    var name: String {get}
    var canFly: Bool {get}
}

extension Bird {
    var canFly: Bool { self is Flyable }
}
//extension of bird sets the default behavior to canFly to return true whenever the type conforms to the flyable protocol. Any flyable bird no longer needs to explicitly declare it canFly


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

//a penguin is a bird, but it can fly
//using protocols, you can define functional components and have any relevant object conform to them


//extending protocols with default implementation
//protocol extensions allow you to define a protocol's default behavior




//enums in swift are powerful, can conform to protocols as well

enum UnladenSwallow: Bird, Flyable {
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


//overriding default behavior

