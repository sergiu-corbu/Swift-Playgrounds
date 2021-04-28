//
//  Model.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 4/6/21.
//

import Foundation
import SwiftUI

enum Orientation {
    case Horizontal
    case Vertical
}

struct Stripe {
    var color: Color = Color.red
    var image: String?
}

struct Section {
    let orientation: Orientation = .Vertical
    var sections: [Section] = []
    
}

struct Flag {
    var components: [Stripe] = []
}
