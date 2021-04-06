//
//  ViewMode.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 4/6/21.
//

import Foundation
import SwiftUI

/*protocol Orientation: Identifiable {
    
}*/

class StripeViewModel: ObservableObject {
    @Published var flag: Flag = Flag()
    
    func add(item: Stripe) {
        flag.components.append(item)
    }
    
    func setColor(color: Color, index: Int) {
        flag.components[index].color = color
    }
    func setImage(image: String, index: Int) {
        flag.components[index].image = image
    }
}


