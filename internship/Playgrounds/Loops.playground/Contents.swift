import UIKit

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["1 album", "2nd album", "3rd album"]

for album in albums {
    print("\(album) is on Apple Music")
}

//repeat

var number = 1
repeat {
    print(number)
    number += 1
} while number <= 20


//exiting multiple loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        if product == 50 {
            print("strange")
            break outerLoop
        }
    }
}

//continue keyword to skip items
