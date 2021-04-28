//
//  ContentView.swift
//  State,StateObject, ObservedObject, EnvObject
//
//  Created by Sergiu Corbu on 3/25/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var state = TestObject()
    var body: some View {
        NavigationView{
            
            VStack {
                Text("State: \(state.num)")
                Button("Increase state", action: {
                    state.num += 1
                    print("State: \(state.num)")
                })
                NavigationLink("To child", destination: ChildView(observedObject: state))
            }
            .onChange(of: state.num) { newState in
                print("State: \(newState)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 class TestObject { //this will not update the value onscreen because State can manage only simple types
 var num: Int = 0
 } */

//to update it, conform the class to observable object
class TestObject: ObservableObject {
    @Published var num: Int = 0
}
