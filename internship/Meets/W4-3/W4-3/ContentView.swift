//
//  ContentView.swift
//  W4-3
//
//  Created by Sergiu Corbu on 4/9/21.
//

import SwiftUI

import NavigationStack

struct ContentView: View {
    var body: some View {
        CoordinatorView()
    }
}

struct CoordinatorView: View {
    @ObservedObject var navigationViewModel: NavigationStack = NavigationStack(easing: Animation.easeInOut)
    
    var body: some View {
        NavigationStackView(transitionType: .custom(.scale), navigationStack: navigationViewModel) {
            A(onNext: {
                handleB()
            })
        }
    }
    
    func handleB() {
        navigationViewModel
            .push(
                B(onBack: {
                    navigationViewModel.pop()
                }, onFinished: {_ in
                    navigationViewModel.push(C(onBack: {
                        navigationViewModel.pop()
                    }))
                }))
    }
}

struct A: View {
    let onNext: () -> Void
    
    var body: some View {
        ZStack {
            Color.pink
            Button(action:{
                onNext()
            }, label: {
                Text("Custom Button")
            })
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}


struct B: View {
    //    @State var active = false
    let onBack: () -> Void
    let onFinished: (Int) -> Void
    @State var number = 10
    
    var body: some View {
        ZStack {
            //            NavigationLink("", destination: C(onBack: {
            //                active = false
            //            }), isActive: $active)
            Color.green
            HStack {
                Button(action:{
                    onFinished(number)
                }, label: {
                    Text("Custom Button")
                })
                
                Button(action:{
                    onBack()
                }, label: {
                    Text("Back")
                })
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct C: View {
    let onBack: () -> Void
    
    var body: some View {
        ZStack {
            Color.purple
            Button(action:{
                onBack()
            }, label: {
                Text("Back")
            })
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
