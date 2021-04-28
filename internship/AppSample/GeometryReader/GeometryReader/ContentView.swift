//
//  ContentView.swift
//  GeometryReader
//
//  Created by Sergiu Corbu on 3/29/21.
//
// to set specific size of a screen for a view, use GeometryReader, it would be imposible to hardcode

//geometry reader tells us the actual available size
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("Left")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.33)
                    .background(Color.yellow)
                Text("Right")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.67)
                    .background(Color.orange)
            }
        }
        .frame(height: 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
