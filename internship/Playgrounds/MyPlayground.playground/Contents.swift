import UIKit

var listOfNumbers = [1,2,3]

var i = 0
var j = listOfNumbers.count - 1

while i < j {
    var aux = listOfNumbers[i]
    listOfNumbers[i] = listOfNumbers[j]
    listOfNumbers[j] = aux
    i += 1
    j -= 1
}

var otherNumbers = [1, 2, 3, 1, 2, 10, 100]

for otherNumber in otherNumbers {
    for number in listOfNumbers {
        if number == otherNumber {
            print(number)
            break
        }
    }
}

var N = 30

var fibonacci = [1, 1]

for i in 2...N - 1 {
    fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
}

for number in fibonacci {
    print(number)
}

var listOfNumbers1 = [1, 2, 3, 1, 2, 10, 100]

var unique: [Int] = []

for number in listOfNumbers1 {
    var numberIsNew = true
    
    for otherNumber in unique {
        if number == otherNumber {
            numberIsNew = false
            break
        }
    }
    
    if numberIsNew {
        unique.append(number)
    }
}

for number in unique {
    print(number)
}

func printNumbers(_ n: Int) {
    if n > 1{
        printNumbers(n - 1)
    }
    print(n)
}
