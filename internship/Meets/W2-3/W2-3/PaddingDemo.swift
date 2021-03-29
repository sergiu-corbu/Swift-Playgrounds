//
//  PaddingDemo.swift
//  W2.3
//
//  Created by Lorena Astalis on 26.03.2021.
//

import SwiftUI

struct MyModifier<T: View>: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .padding(.all, 10)
            .background(Color.lavander)
            .frame(width: 200, height: 200, alignment: .leading)
            .background(Color.blue)
    }
}

extension Text {
    func properties() -> some View {
        self
            .padding(.all, 10)
            .background(Color.lavander)
            .frame(width: 200, height: 200, alignment: .leading)
            .background(Color.blue)
    }
}

struct PaddingDemo: View {
    var body: some View {
       // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).modifier(MyModifier<PaddingDemo>())
        Text("helloooo")
            .properties()
    }
}

struct PaddingDemo_Previews: PreviewProvider {
    static var previews: some View {
        PaddingDemo()
    }
}
