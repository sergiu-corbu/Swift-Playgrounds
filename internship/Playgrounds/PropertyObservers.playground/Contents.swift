import Foundation

// property observers are making observations on propertis. They are triggered when a property being observed changes
// didSet & willSet

struct Car {
    var brand: String
    var mileage: Int
}

// to track the mileage changes

var car: Car? {
    didSet {
        if let mileage = car?.mileage {
            print("My mileage is now \(mileage)")
        }
    }
    willSet(newValue) {
        if let newMileage = newValue?.mileage {
            print("The mileage will be updated to \(newMileage)")
        }
    }
}

car  = Car(brand: "Tesla", mileage: 0)
car?.mileage = 40
car?.mileage = 100

