import Foundation

let url = "https://api.sunrise-sunset.org/json?date=2020-01-01&lat=-74.0060&lng=40.7128&formatted=0"

func getData(from url: String) {
    
   let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
        guard let data = data, error == nil else { return }  // now we surely have data, now convert it
       
        var result: Response?
    
        do {
            result = try JSONDecoder().decode(Response.self, from: data) //try bcz it might not be successful
        } catch {
            print("convertion failed")
        }
        guard let json = result else { return }
        print(json.status)
        print(json.results.sunrise)
    }
    task.resume()
}


// Codable protocol lets us convert data we get from a network call to a struct/class
struct Response: Codable {
    let results: MyResponse
    let status: String
}

struct MyResponse: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: Int
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}

getData(from: url)
