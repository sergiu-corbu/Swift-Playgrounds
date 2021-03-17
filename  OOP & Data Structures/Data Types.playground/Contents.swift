import UIKit

//arrays (lists)

var salaries: [Double] = [4454.0, 33.09, 244.95, 33315.09, 566.9]
//index starts at 0

var highnumber: [Int] = []

let nr = salaries.count
salaries.append(5543.1)
salaries.insert(453, at: 2)
salaries.remove(at: 3)
salaries.removeLast()
salaries.reverse()
salaries.sort() // sort and modify the array
salaries.sorted() //sort without modifying

print(salaries[1])
//salaries.removeLast() or .removeFirst()
var students = [String]() // initialize empty array

//iterating

for item in salaries{
    print(item)
    
}

//enumerated function takes the index and the value as key, pair
for(index, value) in salaries.enumerated(){
    print("Employee \(index + 1): \(value)")
}



//sets (no order)
//empty set
var letters = Set<Character>()
print("Letters is of type Set<Character> with \(letters.count) items" )
letters.insert("a")

letters = [] //empty set, but still a type Set<Character>

var favoriteTeams: Set<String> = ["RMA", "JUV", "MUD"]
favoriteTeams.insert("FCB")

//fundamental set operations
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,44,6,8]
let singleDigitNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted()

oddDigits.intersection(evenDigits).sorted()


//Dictionaries (Hash tables)

var nameofIntegers = [Int: String]() //create empty dict
nameofIntegers[16] = "sixteen"

nameofIntegers = [:] // clear all key value pairs

var airports: [String: String] = ["YYZ": "Toronto", "DUB": "Dublin"]

airports.count

//update value

if let oldValue = airports.updateValue("Dublin airport", forKey: "DUB"){
    print("The old value for DUB was \(oldValue)")
}

//remove value

if let removedValue = airports.removeValue(forKey: "DUB"){
    print("..")
}

//iterating

for(airportCode, airportName) in airports{
    print("..")
}

//airport.keys, airport.values




