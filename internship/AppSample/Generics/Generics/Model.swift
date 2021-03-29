//
//  Model.swift
//  Generics
//
//  Created by Sergiu Corbu on 3/29/21.
//

import Foundation


struct Event: Decodable, Identifiable {
    let title: String
    let date: Date
    let participants: Int
    var id: String { title }
}

struct Person: Decodable {
    let name: String
    let friends: Int
    let joined: Date
}
