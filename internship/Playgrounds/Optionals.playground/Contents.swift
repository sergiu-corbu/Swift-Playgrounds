import Foundation

//An optional value allows us to write clean code with at the same time taking care of possible nil values.

let name: String? = "This is my name"
print(name?.count ?? 0)// nil coalescing


//MARK: force unwrapping
//the  optional will return the value or triggers a runtime error if nil

if let unWrappedName = name{
    print(unWrappedName.count)
}

// unwrapp with 

