//
//  ContentView.swift
//  W2.2
//
//  Created by Sergiu Corbu on 3/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let stack = VStack {
            Text("Hello")
                .foregroundColor(.red)
           MyButton()
            VStack {
                Text("text1")
            }
            Text("text2")
            Text("text3")
        
        }
        
        return stack
    }
    
    func button() -> AnyView  {
        return AnyView (
            Button(action: {print("Button tapped")}, label: {
                Label(
                    title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
                    icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
                )
            })
    )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
