//
//  RotatedBadge.swift
//  SwiftUI_Tutorials
//
//  Created by Sergiu Corbu on 3/24/21.
//

import SwiftUI

struct RotatedBadge: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}
