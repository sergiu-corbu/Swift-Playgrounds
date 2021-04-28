//
//  StripeView.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 4/6/21.
//

import SwiftUI

struct StripeView: View {
    let stripe: Stripe
    var body: some View {
        Rectangle()
            .foregroundColor(stripe.color)
            .overlay(Image(stripe.image ?? "")
                        .resizable()
                        .frame(width: 45, height: 45))
    }
}

struct StripeView_Previews: PreviewProvider {
    static var previews: some View {
        StripeView(stripe: Stripe())
    }
}
