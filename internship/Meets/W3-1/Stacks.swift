//
//  ContentView.swift
//  w3-1
//
//  Created by Sebastian Pomirleanu on 29.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            grid()
        }
    }
    
    func grid() -> some View {
        LazyVStack(spacing: 16) {
            ForEach(0..<1000) { (index: Int) in
                gridRow(row: index * 3)
    
            }
        }
    }
    
    func cell(number: Int) -> some View {
//        Color.gray
//            .frame(height: 100)
//            .overlay(Text("\(number)"))
        
        Text("\(number)")
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color.gray)
    }
    
    
    func gridRow(row: Int) -> some View {
            HStack(spacing: 16) {
                cell(number: row)
                cell(number: row + 1)
                cell(number: row + 2)
            }
    }
    
    func exempl1() -> some View {
        VStack(content: {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                .background(Color.blue)
            Text("val2")
                .background(Color.red)
            Text("val3")
                .background(Color.green)
            Text("test ts")
                .foregroundColor(.white)
                .frame(width: 400, alignment: .topLeading)
                .background(Color.yellow)
        })
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
