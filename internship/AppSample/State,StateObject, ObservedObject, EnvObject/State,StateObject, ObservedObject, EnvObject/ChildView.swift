//
//  ChildView.swift
//  State,StateObject, ObservedObject, EnvObject
//
//  Created by Sergiu Corbu on 3/25/21.
//

import SwiftUI

struct ChildView: View {
    @ObservedObject var observedObject: TestObject
    
    var body: some View {
        VStack {
            Text("ObservedObject: \(observedObject.num)")
            Button("Increase observedObject", action: {
                observedObject.num += 1
                print("ObservedObject \(observedObject.num)")
            })
        }
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView(observedObject: TestObject())
    }
}
