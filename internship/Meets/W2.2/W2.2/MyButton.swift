//
//  MyButton.swift
//  W2.2
//
//  Created by Sergiu Corbu on 3/23/21.
//

import SwiftUI

struct MyButton: View {
    var ok: Bool = false
    var body: some View {
        Button(action: {print("Button tapped")}, label: {
            if ok {
                Label(
                    title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
                    icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
                )
            } else {
                Image(systemName: "bag")
            }
           
        })
    }
}


struct OtherButton: View {
    var count: Int = 3
    
    
    var body: some View {
        if count == 1 {
            Text("M")
        } else if count == 2{
            Image(systemName: "bag")
        } else if count == 3{
            Text("sf")
            Text("sf")
            Text("sf")
        }
    }
}


struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        OtherButton()
    }
}
