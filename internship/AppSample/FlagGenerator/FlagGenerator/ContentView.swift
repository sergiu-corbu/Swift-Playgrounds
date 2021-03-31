//
//  ContentView.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 3/30/21.
//

import SwiftUI

let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width

/*struct ContentView: View {
 
 @State private var Htapped = false
 @State private var VTapped = false
 @State private var StripebuttonPressed: Bool = false
 @State private var CommitbuttonPressed: Bool = false
 
 var body: some View {
 
 VStack {
 
 VStack {
 Flag()
 }
 .frame(width: width, height: 300)
 .background(Color.red)
 .edgesIgnoringSafeArea(.top)
 
 VStack {
 if StripebuttonPressed {
 Options()
 .viewProperties()
 }
 Subsection(HTapped: $Htapped, VTapped: $VTapped)
 .viewProperties()
 
 if Htapped {
 CustomButton(buttonPressed: $StripebuttonPressed, text: "Add Stripe", color: Color.blue)
 .padding(.top, 10)
 
 CustomButton(buttonPressed: $CommitbuttonPressed, text: "Commit Section", color: Color.green)
 }
 else if VTapped {
 if !Htapped {
 CustomButton(buttonPressed: $StripebuttonPressed, text: "Add Stripe", color: Color.blue)
 .padding(.top, 10)
 
 CustomButton(buttonPressed: $CommitbuttonPressed,text: "Commit Section", color: Color.green)
 }
 
 }
 } // 2nd vstack
 .padding(.top, -25)
 Spacer()
 } // main vstack
 .background(Color(UIColor.systemGray3))
 .edgesIgnoringSafeArea(.bottom)
 }
 
 } */

struct ContentView: View {
    
    let widthX: CGFloat = 200
    let heightY: CGFloat = 100
    
    var body: some View {
        Section{
            HStack(spacing: 0) {
                
                Shape(orientation: .horizontal, color: Color.deepBlue, image: "img")
                    .frame(width: widthX / 2  , height: heightY)
                VStack(spacing: 0) {
                    Shape(orientation: .vertical, color: Color.white, image: "")
                        .frame(width: widthX / 2, height: heightY / 2)
                    Shape(orientation: .vertical, color: Color.red, image: "")
                        .frame(width: widthX / 2, height: heightY / 2)
                }
            }
            .frame(width: widthX, height: heightY)
        }
    }
}

enum Orientation {
    case horizontal
    case vertical
}

struct Shape: View {
    
    let orientation: Orientation
    var color: Color
    var image: String?
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .overlay(Image(image ?? "")
                        .resizable()
                        .frame(width: 45, height: 45))
    }
}

struct Flag: View {
    
    var body: some View {
        VStack {
            
        }
        .frame(width: 220, height: 130)
        .background(Color.yellow)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func viewProperties () -> some View {
        self
            .padding(.top, 25)
            .padding(.bottom, 35)
            .background(Color.white)
            .cornerRadius(15)
    }
}

extension Color {
    static let deepBlue = Color("deep blue")
}

class FlagModel: ObservableObject {
    @Published var components: [Shape]
    
    init(components: [Shape]) {
        self.components = components
    }
    
    
}
