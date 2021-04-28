//
//  DataModel.swift
//  SwiftUI_Tutorials
//
//  Created by Sergiu Corbu on 3/23/21.
//

import Foundation
import Combine

final class DataModel: ObservableObject {
    @Published var landmarks: [Landmark] = Bundle.main.decode([Landmark].self, from: "landmarkData.json")
    //@Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json") // no need for @Published because it will never change
}

//method 1
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError("File not found in Bundle")}
        
        guard let data = try? Data(contentsOf: url) else { fatalError("Errorr")}
        let decoder = JSONDecoder()
        guard let loadedResult = try? decoder.decode(T.self, from: data) else { fatalError("Error while decoding")}
        return loadedResult
    }
}

//method2
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Couldn't find \(filename) in main bundle")}
    do { data = try Data(contentsOf: file) } catch { fatalError("Error") }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch { fatalError("errorrr")}
}
