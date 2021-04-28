import Foundation

/*
var dataBase: [String : String] = [:]

@propertyWrapper struct Stored {
    let key: String
    var wrappedValue: String {
        get { return dataBase[key]! }
        set { dataBase[key] = newValue }
    }
    
    init(wrappedValue: String, key: String) {
        self.key = key
        self.wrappedValue = wrappedValue
    }
    func printVal() {
        print("default val")
    }
}

class Main {
    @Stored(wrappedValue: "test1", key: "name") public var myValue: String
    
    func foo() {
        print(myValue)
        myValue = "test2"
        print(myValue)
    }
}

var val = Main()
val.foo()
*/

/*

//MARK: MVC
class Phone {
    var number: Int = 754324567
    init(number: Int){
        self.number = number
    }
}

class PhoneView {
    let phone: Phone
    var onIncrement: (() -> Void)!  // empty closure
    
    init(phone: Phone) {
        self.phone = phone
    }
    
    func increment() {
        onIncrement()
    }
    
    func render() {
        print("This phone has the following number: \(phone.number)")
    }
}


class Controller {
    
    var phone = Phone(number: 0538352392)
    var view: PhoneView!
    
    func run() {
        self.view = PhoneView(phone: phone)
        view.onIncrement = {
            self.phone.number += 1
            self.view.render()
        }
        view.render()
        view.onIncrement()
    }
}

let controller = Controller()
controller.run()
*/


//MARK: MVVM

class Phone {
    var number: Int = 754324567
    init(number: Int){
        self.number = number
    }
}

protocol Observer {
    func notify()
}

struct PhoneView: Observer {
    
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.viewModel.addSubscriber(observer: self)
    }
    
    func notify() {
        render()
    }

    func increment() {
        viewModel.increment()
    }
    
    func render() {
        print("This phone has the following number: \(viewModel.phone.number)")
    }
}

class ViewModel {
    
    var phone: Phone
    
    init(phone: Phone){
        self.phone = phone
    }
    var observers: [Observer] = []
    
    func addSubscriber(observer: Observer) {
        observers.append(observer)
    }
    
    func increment() {
        phone.number += 1
        observers.forEach({$0.notify()})
    }
}

class MyProgram {
    
    static func main() {
        let myPhone = Phone(number: 0538352392)
        let viewModel = ViewModel(phone: myPhone)
        let view = PhoneView(viewModel: viewModel)
        view.render()
        view.increment()
    }
}

MyProgram.main()

