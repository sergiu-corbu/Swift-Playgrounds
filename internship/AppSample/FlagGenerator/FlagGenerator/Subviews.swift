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
    
    var body: some View {
        HStack {
            VStack {
                Text("ORIENTATION")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .padding(.bottom, 20)
                HStack {
                    SmallVLine()
                    SmallHLine()
                }
                
            }.frame(height: 100)
            
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
                }
                .padding(.top, 24)
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
        }
        .frame(width: width - 60 , height: 60)
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
struct HLine: View {
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

struct SmallVLine: View {
    
    var body: some View {
        HStack {
            Rectangle()
                .vProperties()
            Rectangle()
                .vProperties()
                .padding(.leading, -5)
        }
    }
}
struct SmallHLine: View {
    var body: some View {
        VStack {
            Rectangle()
                .hProperties()
                
            Rectangle()
                .hProperties()
                .padding(.top, -5)
        }
    }
}
extension Rectangle {
    func vProperties() -> some View {
        self
            .foregroundColor(.blue)
            .frame(width: 13, height: 30)
    }
    
    func hProperties() -> some View {
        self
            .foregroundColor(.blue)
            .frame(width: 30, height: 13)
    }
}

struct Subviews_Previews: PreviewProvider {
    static var previews: some View {
        SubsectionView(HTapped: .constant(false), VTapped: .constant(false))
        //OptionsView(viewModel: ViewModel(), index: 0)
       
    }
}
