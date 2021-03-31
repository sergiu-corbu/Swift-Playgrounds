//
//  ProgressViewApp.swift
//  ProgressView
//
//  Created by Sergiu Corbu on 3/31/21.
//

import SwiftUI

@main
struct ProgressViewApp: App {
  
    var body: some Scene {
        WindowGroup {
            ContentView(game: Game(name: "Zelda: Breath of the Wild", developer: "Nintendo EPD", cover: Image(""), progress: 0.75))
        }
    }
}
