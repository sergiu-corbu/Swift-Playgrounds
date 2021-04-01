//
//  ContentViewV1.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 4/1/21.
//

import SwiftUI

struct ContentViewV1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentViewV1_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewV1()
    }
}
/*
let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width

struct ContentView: View {
 
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
 
 }

struct ContentView: View {
    
    let widthX: CGFloat = 200
    let heightY: CGFloat = 100
    
    @ObservedObject var shapes: FlagComponents
    
    var HShapes: [Shape] {
        return shapes.components.filter({$0.orientation == .horizontal})
    }
    var VShapes: [Shape] {
        return shapes.components.filter({$0.orientation == .vertical})
    }
    
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                ForEach(HShapes, id: \.self) { shape in
                    shape
                }
                VStack(spacing: 0) {
                    ForEach(VShapes, id: \.self) { shape in
                        shape
                    }
                }
            }
            .frame(width: widthX, height: heightY)
        }
    }
}

class FlagComponents: ObservableObject {
    @Published var components: [Shape] = [ Shape(orientation: .horizontal, color: Color.deepBlue, image: "img"), Shape(orientation: .vertical, color: Color.white, image: ""), Shape(orientation: .vertical, color: Color.red, image: "")]
    
    init(components: [Shape]) {
        self.components = components
    }
}

enum Orientation {
    case horizontal
    case vertical
}

struct Shape: View, Hashable {
    
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

*/
