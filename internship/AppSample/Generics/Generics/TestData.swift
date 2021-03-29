//
//  TestData.swift
//  Generics
//
//  Created by Sergiu Corbu on 3/29/21.
//

import Foundation


//working hard solution, a func for each type of data
/*
struct TestData {
    static let events: [Event] = loadEvents()
    static let participants: [Person] = loadParticipants()
    
    static func loadEvents() -> [Event] {
        let url = Bundle.main.url(forResource: "Events", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try! decoder.decode([Event].self, from: data)
    }
    
    static func loadParticipants() -> [Person] {
        let url = Bundle.main.url(forResource: "Participants", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try! decoder.decode([Person].self, from: data)
    }
}*/

//best solution, using generics

struct TestData {
    static let events: [Event] = readFile(named: "Events")
    static let participants: [Person] = readFile(named: "Participants")
    
    static func readFile<ModelType: Decodable>(named name: String) -> [ModelType] {
        let url = Bundle.main.url(forResource: name, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try! decoder.decode([ModelType].self, from: data)
    }
}

//the func will take any type that conforms to decodable
