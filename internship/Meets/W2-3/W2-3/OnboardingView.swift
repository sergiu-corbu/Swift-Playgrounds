//
//  OnboardingView.swift
//  W2.3
//
//  Created by Lorena Astalis on 26.03.2021.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text("Hello!")
            Spacer()
            Toggle("Test", isOn: Binding.constant(true))
            
        }
        .background(Color.pink)
    }
    
    func button(withClip clip: Bool) -> some View {
        Group {
            if clip {
                 Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Tapp")
                        .background(
                            Color.lavander
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            } else {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Tapp")
                        .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle.init())
                                        .fill(Color.lavander))
                })
            }
        }
        
    }
    func button2(withClip clip: Bool) -> AnyView {
            if clip {
                return AnyView(
                 Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Tapp")
                        .background(
                            Color.lavander
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }))
            } else {
                return AnyView(
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Tapp")
                        .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle.init())
                                        .fill(Color.lavander))
                }))
            }
        }
        
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
