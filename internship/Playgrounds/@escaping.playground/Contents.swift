import UIKit

// when you pass in a closure and add @escaping as a parameter, it can do 2 things: 1. Execute immediately the func, and that would be non-escaping

// use @escaping when the closure needs to outlive the life of its function, like waiting for a download to complete, so it has to live outside the func, in MEMORY


// completion handler will escape the session
func getData(completion: @escaping ((Bool) -> Void)) {
    let task = URLSession.shared.dataTask(with: URL(string: "")!) { data, response, error in
        guard data != nil else { completion(false); return}
        completion(true)
    }
    task.resume()
}

final class APICaller {
    var isReady:Bool = false
    
    func warmup() {
        isReady = true
        
        if !completionHandlers.isEmpty {
            completionHandlers.forEach({ $0()})
            completionHandlers.removeAll()
        }
    }
    
    var completionHandlers = [(() -> Void)]()
    
    func doSomething(completion: @escaping (() -> Void)) {
        guard isReady else {
            completionHandlers.append {
                completion()
            }
            return
        }
        completion()
    }
}

APICaller().doSomething {
    
}
