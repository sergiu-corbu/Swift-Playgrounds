import UIKit
import Foundation

enum PropertyType: String{
    case House
    case Apartment
    case Commercial
}

struct Property{
    
    var locationName: String
    var city: String
    var rent: Int
    var type: PropertyType
    var facilities: [String]
    
    var icon: String{
        var pic: String!
        if type == .Apartment{
            pic = "🏙"
        }
        else if type == .House{
            pic = "🏠"
        }
        else if type == .Commercial{
            pic = "🏢"
        }
        return pic
    }
    
    var pricing: String{
        let rent: Int = self.rent
        var pr: String
        switch rent{
            case 1 ..< 600:
                pr = "The renting price is quite cheap 💰"
            case 600 ..< 1001:
                pr = "The renting price is acceptable 💰💰"
            case 1001 ... 6000:
                pr = "The renting price is high 💰💰💰"
            default:
               pr = "The price is not set or incorrect format"
        }
        return pr
    }
    
    mutating func addFacility(facility: String){
        facilities.append(facility)
    }
    
    func description() -> String{
        return "\(locationName) is a \(type.rawValue) \(icon) located in \(city), at \(rent) lei / month"
    }
    
    func getFacilities() -> String{
        var allFacilities: String = ""
        
        for facility in facilities{
            allFacilities += facility
        }
        return allFacilities
    }

}

var property0 = Property(locationName: "Cozy suite", city: "Oradea", rent: 500, type: .Apartment, facilities: ["Wifi, Parking Spot, indoor loundery"])
var property1 = Property(locationName: "One city residence", city: "Cluj-Napoca", rent: 1300, type: .Apartment, facilities: ["Wifi, Parking Spot"])
var property2 = Property(locationName: "Costica house", city: "Oradea", rent: 1000, type: .House, facilities: ["Garden, near Center, barbeque, wifi"])
var property3 = Property(locationName: "Iulius Mall", city: "Cluj-Napoca", rent: 5000, type: .Commercial, facilities: ["Multiple parking spots", "Emergency exit"])

private func listAllNames() -> [String]{
    var result: [String] = []
    print("Below is a list of all the locations available:")
    for prop in listOfProperties{
        result.append(prop.locationName)
    }
    return result
}



print(property1.description())
property1.addFacility(facility: " loundering")
property1.addFacility(facility: " pet friendly")

print(property1.getFacilities())
print(property2.description())


let listOfProperties = [property0, property1, property2, property3]


//MARK: FILTER
let ClujLocations = listOfProperties.filter({ return $0.city == "Cluj-Napoca"})

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

//MARK: MAP & NEW PRICES CONVERSION
print("Prices in euro: ")
let rentInEuro: [Double] = listOfProperties.map({ return (Double($0.rent) / 4.88).roundTo(places: 2) })


var Location_Price: [String : Double] = [:]
for item in 0 ..< listOfProperties.count {
    Location_Price[listOfProperties[item].locationName] = Double(listOfProperties[item].rent)
}


print(listAllNames())
print(rentInEuro)

print(Location_Price)
print(property3.pricing)
