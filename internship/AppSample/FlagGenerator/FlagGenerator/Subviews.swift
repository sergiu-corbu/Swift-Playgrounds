//
//  Subviews.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 3/30/21.
//

import SwiftUI

struct OptionsView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let image: String = "img"
    let index: Int
    var color: Color {
        viewModel.flag.components[index].color
    }
 /*   var image: String {
        viewModel.flag.components[index].image!
    }*/
    
    var body: some View {
        VStack {
            HStack {
                Text("COLOR")
                    .padding(.leading, 70)
                Spacer()
                Text("EMBLEM")
                    .padding(.trailing, 70)
            }
            .font(.headline)
            HStack {
                Rectangle()
                    .foregroundColor(color)
                    .frame(width: 100, height: 27)
                    .padding(.leading, 50)
                ColorPicker("", selection: colorBinding)
                    .padding(.trailing, 40)
                Spacer()
                Button(action: {
                    viewModel.setImage(image: image, index: index)
                }, label: {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 90)
                })
                
            }
        }
        .frame(width: width - 50 , height: 60)
    }
    var colorBinding: Binding<Color> {
        return .init {
            return color
        } set: { (newValue) in
            self.viewModel.setColor(color: newValue, index: index)
        }
    }
}

struct SubsectionView: View {
    
    @Binding var HTapped: Bool
    @Binding var VTapped: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("ADD SUBSECTION")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.bottom, 10)
            }
            HStack {
                Button(action: { VTapped.toggle()}, label: { VLine() })
                Divider()
                Button(action: { HTapped.toggle()}, label: { HLine() })
            }
            .padding(.bottom, 10)
        }
        .frame(width: width - 50 , height: 60)
    }
}
struct VLine: View {
    
    var body: some View {
        HStack {
            Rectangle()
                .vProperties()
            Rectangle()
                .vProperties()
                .padding(.leading, -4)
                .padding(.trailing, 55)
        }
    }
}
struct  HLine: View {
    var body: some View {
        VStack {
            Rectangle()
                .hProperties()
            Rectangle()
                .hProperties()
                .padding(.top, -4)
        }
        .padding(.leading, 55)
    }
}
extension Rectangle {
    func vProperties() -> some View {
        self
            .foregroundColor(.blue)
            .frame(width: 13, height: 35)
    }
    
    func hProperties() -> some View {
        self
            .foregroundColor(.blue)
            .frame(width: 35, height: 13)
    }
}
struct Subviews_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(viewModel: ViewModel(), index: 0)
    }
}
