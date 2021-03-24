//
//  DataModel.swift
//  SwiftUI_Tutorials
//
//  Created by Sergiu Corbu on 3/23/21.
//

import Foundation
import Combine

final class DataModel: ObservableObject {
   @Published var landmarks: [Landmark] = load("landmarkData.json")
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Couldn't find \(filename) in main bundle")}
    do { data = try Data(contentsOf: file) } catch { fatalError("Error") }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch { fatalError("errorrr")}
}
