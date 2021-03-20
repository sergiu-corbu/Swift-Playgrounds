protocol Emp {
    var name: String {get set}
    var jobTitle: String {get set}
    
    func doWork()
}

struct Executive: Emp {
    var name: String = "Jobs"
    var jobTitle: String = "CEO"
    
    func doWork() {
        print("\(name) is the \(jobTitle) of our company")
    }
}

struct Manager: Emp {
    var name = "Maurice Moss"
    var jobTitle = "Head of IT"
    
    func doWork() {
        print("I'm turning it off and on again.")
    }
}

let staff: [Emp] = [Executive(), Manager()]

for person in staff {
    person.doWork()
}


//protocol inheritance

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }


//extensions allow to add methods to existing types, to do things aren't adesigned otdo

extension Int {
    func squared() -> Int {
        return self * self
    }
}


let number = 8
number.squared()


//protocol extensions
//protocols dont provide the code inside
//extensions provide code, but affects only one data type
let array = ["Tom", "Bill", "Terry", "Terry"]
let set = Set(["John", "Paul", "George"])

extension Collection {
    func summarize() {
        print("There are \(count) of us: ")
        for name in self {
            print(name)
        }
    }
}

array.summarize()


//protocol oriented programming

protocol Identifiable {
    var id: String {get set}
    func identify()
}


extension Identifiable{
    func identify() {
        print("My id is \(id).")
    }
}

struct User: Identifiable {
    var id: String
}

let twoStraws = User(id: "tow strows")
twoStraws.identify()
