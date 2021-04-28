//
//  Layout.swift
//  LayoutPractice
//
//  Created by Sergiu Corbu on 3/29/21.
//

import SwiftUI

struct Layout: View {
    var text: String
    var imageName: String?
    
    var body: some View {
        GeometryReader { geometry in
            if let image = imageName {
                HStack {
                    Text(text)
                        .lineLimit(nil)
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geometry.size.width / 2)
                } .padding([.leading, .trailing], 10)
            } else {
                HStack {
                    Text(text)
                        .lineLimit(nil)
                } .padding([.leading, .trailing], 10)
            }
        } //.frame(width: UIScreen.main.bounds.width)
      
        
    } // body end
}

struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        Layout(text: "I think this new invention is awesomeee", imageName: "cola")
    }
}
