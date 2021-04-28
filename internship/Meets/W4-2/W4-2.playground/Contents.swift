import Foundation

let url = "https://httpbin.org/get"

var request = URLRequest.init(url: URL(string: url)!)

request.httpMethod = "GET"

var session = URLSession.init(configuration: .default)
let task = session.dataTask(with: request) { (data, response, error) in
    print(data)
    print(response)
    if let data = data {
        let string = String(data: data, encoding: .utf8)
        print(string ?? "empty")
        do {
            let json = try JSONDecoder().decode(MyData.self, from: data)
            print(json)
        } catch let error {
            print(error)
        }
    }
}
task.resume()


struct Args: Codable {
    let id: String?
}
struct Header: Codable {
    let accept: String
    let acceptEncoding: String
    let acceptLanguage: String
    let host: String
    let userAgent: String
    
    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
        case host = "Host"
        case userAgent = "User-Agent"
    }
}
struct MyData: Codable {
    
    let args: Args
    let headers: Header
    let origin: String
    let url: String
}

let uploadUrl = URL(string: "http://httpbin.org/put")
var request1 = URLRequest.init(url: uploadUrl!)
request1.httpMethod = "PUT"

let uploadData = "".data(using: .utf8)
let uploadTask = session.uploadTask(with: request1, from: uploadData) { (data, respnse, error) in
    print(respnse)
}

uploadTask.resume()
