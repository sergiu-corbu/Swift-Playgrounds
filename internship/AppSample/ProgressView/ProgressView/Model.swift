//
//  Model.swift
//  ProgressView
//
//  Created by Sergiu Corbu on 3/31/21.
//

import Foundation
import SwiftUI

struct Game {
    var name: String
    var developer: String
    var cover: Image
    var progress: Double
}

struct ProgressEdit {
    var progress: Double = 0.0
    var isUpdating = false
    
    mutating func present(currentGameProgress: Double) {
        progress = currentGameProgress
        isUpdating = true
    }
}

extension Double {
    func toProgressString() -> String {
        let percentage = Int(self * 100)
        return percentage.description + "%"
    }
}
