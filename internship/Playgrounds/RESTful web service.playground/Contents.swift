// send http post request example

import Foundation

//prepare url

let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
guard let requestUrl = url else { fatalError() }

// prepare url request object

var request = URLRequest(url: requestUrl)
request.httpMethod = "POST"

//http parameters to be sent in http request body
let postString = "userId=300&title=My urgent task&completed=false"//;

//set http request body
request.httpBody = postString.data(using: String.Encoding.utf8)

//perform request
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    
    //check for error
    if let error = error {
        print ("error took place")
        return
    }
    //convert http response data to a string
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
        print ("Response data string: \n \(dataString)")
    }
}

task.resume()
