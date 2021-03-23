import UIKit

protocol EngineType {
    
}

class InlineEngine: EngineType {
    
}

class Engine<T: EngineType> {
    
}

class Car<U,T: Engine<U>> {
    var engine: T
    
    init(engine: T) {
        self.engine = engine
    }
    
}

let someEngine = Engine<InlineEngine>()

let myCar = Car(engine: someEngine)



protocol Vehicle {
    associatedtype VehicleType: VehicleTypeProtocol
    
    var type: VehicleType { get }
    
   // var engine: some Engine { get set}
}

protocol VehicleTypeProtocol {
    func printName()
}

enum TruckTypes: VehicleTypeProtocol {
    case water
    case land
    
    func printName() {
        switch self {
            case .water:
                print("Water vehicle")
            case .land:
                print("land vehicle")
        }
    }
}

struct Truck: Vehicle {
    typealias VehicleType = TruckTypes
    
    var type: TruckTypes {
        return .land
    }
}


extension Vehicle {
    func showDescription() {
        self.type.printName()
    }
}


let truck = Truck()
truck.showDescription()


func testTruck<T: Vehicle>(vehicle: T) {
    vehicle.showDescription()
}

testTruck(vehicle: truck)

func printSomeVehicle() -> some Vehicle {

    return Truck()
}

printSomeVehicle()
