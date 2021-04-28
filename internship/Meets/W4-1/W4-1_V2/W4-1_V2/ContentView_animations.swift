//
//  ContentView.swift
//  W4-1_V2
//
//  Created by Sebastian Pomirleanu on 05.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        HStack(spacing: 0) {
//            Text("text adsfadsfadsg2 si mai mnult")
//                .background(Color.purple)
//                .layoutPriority(2)
//                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//            Text("@@@@ /// ,,, @@@@ }}}}}}}")
//                .background(Color.yellow)
//                .layoutPriority(2)
//        }
        //geometry()
        animatie()
    }
    
    func geometry() -> some View {
        VStack() {
            Text("ceva text de prezenta")
            GeometryReader(content: { (geometry:GeometryProxy) in
                Color.red
                    .overlay(Text("test"))
                    .padding([.top, .leading], geometry.size.width/2)
            })
            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
    
    @State var isExpandig: Bool = false
    func animatie() -> some View {
        VStack() {
            Color.red
                .animation(nil)
                .frame(width: isExpandig ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 0.2))
            Text(isExpandig ? "first" : "second")
            Button(action: {
//                withAnimation(.easeIn(duration: 0.2)) {
//                    isExpandig = !isExpandig
//                }
                isExpandig = !isExpandig
            }, label: {
                Text("Button")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
