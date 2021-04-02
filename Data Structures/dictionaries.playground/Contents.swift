import UIKit


// empty dict
var nameOfIntegers = [Int:String]()
nameOfIntegers = [:]

nameOfIntegers = [1: "one", 2: "two"]

nameOfIntegers.count

if let oldValue = nameOfIntegers.updateValue("this is one", forKey: 1){
    print("the old value for 1 was \(oldValue)")
}

for (integerName, integerNumber) in nameOfIntegers{
    print("...")
}

for integerNumber in nameOfIntegers.keys{
    print(integerNumber)
}

for integerName in nameOfIntegers.values{
    print(integerName)
}

