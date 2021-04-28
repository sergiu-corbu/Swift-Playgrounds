import UIKit


struct Device{
    var type: String
    var price: Float
    var color: String
}

var iphone7 = Device(type: "iphone", price: 499.9, color: "black")
var iphone4s = Device(type: "iphone", price: 49.9, color: "white")
var macbook = Device(type: "Macbook", price: 1299.9, color: "gray")

let myDevices = [iphone7, iphone4s, macbook]

//MARK: filter

//basic solution
var phones: [Device] = []
for device in myDevices{
    if device.type == "iphone"{
        phones.append(device)
    }
}
//print(phones)


//filter solution !!!
let iPhones = myDevices.filter({ return $0.type == "iphone" })
// $0 is the placeholder for the object in the array

//MARK: map
//iterate and transform every value needed
let CAD_Prices: [Float] = myDevices.map({ return $0.price * 1.2})

//MARK: reduce
//combine all values into one
let totalCAD_Prices: Float = CAD_Prices.reduce(0.0, +)
//print(totalCAD_Prices)
