//
//  ContentView.swift
//  ActivityIndicator
//
//  Created by Sergiu Corbu on 4/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false

    var body: some View {
        ZStack {
            Color(.red)
                .ignoresSafeArea()
            Text("Spinner")
            
            
            if isLoading {
                ZStack{
                    Color(.white)
                        .ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(3)
                }
               
            }
            
        }
        .onAppear { startFakeCall() }
    }
    
    func startFakeCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
