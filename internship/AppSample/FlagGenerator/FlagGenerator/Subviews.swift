//
//  Subviews.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 3/30/21.
//

import SwiftUI

struct Subviews_Previews: PreviewProvider {
    static var previews: some View {
        Options()
       // CustomButton(text: "MEe", color: Color.gray)
    }
}



struct Options: View {
    @State private var selectedColor = Color.black
    
    var body: some View {
        HStack {
            VStack {
                Text("COLOR")
                    .font(.headline)
                Rectangle()
                    .hProperties()
            }
            
            VStack {
                Text("EMBLEM")
                    .font(.headline)
                Image(systemName: "swift")
            }
        }
        .frame(width: width - 50 , height: 60)
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
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 27)
                    .padding(.top, 20)
                    .padding(.leading, 50)
                ColorPicker("Select a color", selection: $selectedColor)
                Spacer()
                Image("img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(.trailing, 70)
            }
        }
        .frame(width: width - 50 , height: 60)
    }
 
}


struct Subsection: View {
    
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
                Button(action: {
                    VTapped.toggle()
                }, label: {
                    VLine()
                })
                
                Divider()
                
                Button(action: {
                    HTapped.toggle()
                }, label: {
                    HLine()
                })
            }
            .padding(.bottom, 10)
        }
        .frame(width: width - 50 , height: 60)
    }
}

struct CustomButton: View {
    @Binding var buttonPressed: Bool
    
    var text: String
    var color: Color
    
    var body: some View {
        Button(action: {
            buttonPressed.toggle()
        }){
            Text(text)
                .foregroundColor(.white)
                .font(.title2)
                .bold()
                .tracking(1)
        }
        
        .frame(width: width - 50, height: 65)
        .background(color)
        .cornerRadius(10.0)
        .padding([.top, .bottom], 10)
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
