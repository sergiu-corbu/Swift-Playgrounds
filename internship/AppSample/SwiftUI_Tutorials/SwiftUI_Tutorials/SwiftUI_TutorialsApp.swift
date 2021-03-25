//
//  SwiftUI_TutorialsApp.swift
//  SwiftUI_Tutorials
//
//  Created by Sergiu Corbu on 3/23/21.
//

import SwiftUI

@main
struct SwiftUI_TutorialsApp: App {
    
    @StateObject private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
