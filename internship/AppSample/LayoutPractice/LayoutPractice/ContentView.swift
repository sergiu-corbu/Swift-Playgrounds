//
//  ContentView.swift
//  LayoutPractice
//
//  Created by Sergiu Corbu on 3/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       VStack {
                Layout(text: "meeeeeeeee", imageName: "cola")
                Layout(text: "sae", imageName: "cola")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
