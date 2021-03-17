import Foundation

//protocols holds definitions, not the body, if get or set
//a set of rules
//it declares functions that another class promises to have

protocol CarDataSource{
    var color: String { get set }
    
    func drive()
    func isAWD() -> Bool
}


class Car{
    
}

class BMW: Car, CarDataSource{
    
    var color: String
    
    init(color: String){
        self.color = color
    }
    
    func drive() {
        <#code#>
    }
    
    func isAWD() -> Bool {
        return true
    }
    
    
    
}
