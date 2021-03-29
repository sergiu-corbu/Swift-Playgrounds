import UIKit

// when you pass in a closure and add @escaping as a parameter, it can do 2 things: 1. Execute immediately the func, and that would be non-escaping

// use @escaping when the closure needs to outlive the life of its function, like waiting for a download to complete, so it has to live outside the func, in MEMORY

// closures used as completion handlers(aka the code called when a long running task has finished
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

// for example downloading an image from the internet
// making a http request to download smth. The argument completionHandler is a closure. It's called when the download has finished

let task1 = URLSession.shared.dataTask(with: URL(string: "http://example.com/cats.jpg")!, completionHandler: {data, response, error in
    //do smth with the data
})


// from Swift Foundation framework
// url: the url resource for downloading
// completionHandler: a closure
    //  Data? : the data the request returns itself
    // URLResponse?: an object that contains information about the response
    // Error?: an optional valur that contains an error object or a nill
    // @escaping: the closure passed as an argument for this parameter can escape the data can escape the dataTask(with: completionHandler. In other words, the closure is called after the function dataTask funishes executing
    // basically, the completion handler is executed in the future


// an escaping closure is a closure that is called after the function was passed to returns. It outlives the function it was passed to

// a non escaping closure is a closure that's called within the function it was passed to. Before it returns
/*func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    
} */

// escaping closure

class TaskManager {
    var onTaskFinished: (() -> Void)?
    
    func startLenghtyTask(completionHandler: @escaping () -> Void) {
        //do some completion for later
        onTaskFinished = completionHandler
            // ..do task
    }
    
    func onLenghtyTaskFinished() {
        onTaskFinished?() // call the completion handler
    }
}

let task = TaskManager()
task.startLenghtyTask(completionHandler: {print("Completion done")})

//MARK: why would we need to mark a closure with @escaping?
// @escaping closure can cause a strong reference cycle if self is used inside the func. It's a warning sign. You let the closure escape anyway so mark it

// non escaping closures can refer to self implicitly
// escaping closures must refer to self explicitly, or use a capture list
