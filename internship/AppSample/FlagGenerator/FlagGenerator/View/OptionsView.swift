//
//  OptionsView.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 4/6/21.
//

import SwiftUI

struct OptionsView: View {
    @ObservedObject var viewModel: StripeViewModel
    let image: String = "img"
    let index: Int
    var color: Color {
        viewModel.flag.components[index].color
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("COLOR")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding(.trailing, 25)
                HStack {
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: 90, height: 27)
                    ColorPicker("", selection: colorBinding)
                        .frame(width: 30)
                } .padding(.top, 24)
            }
            
            VStack {
                Text("EMBLEM")
                    .foregroundColor(.black)
                    .font(.subheadline)
                Button(action: {
                    viewModel.setImage(image: image, index: index)
                }, label: {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                })
            }
        }
        .frame(width: width - 60 , height: 60)
        
    }
    var colorBinding: Binding<Color> {
        return .init {
            return color
        } set: { (newValue) in
            self.viewModel.setColor(color: newValue, index: index)
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(viewModel: StripeViewModel(), index: 0)
    }
}
