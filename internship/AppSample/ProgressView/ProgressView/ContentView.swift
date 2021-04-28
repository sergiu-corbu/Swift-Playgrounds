//
//  ContentView.swift
//  ProgressView
//
//  Created by Sergiu Corbu on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    
    let game: Game
    @State private var progressEdit = ProgressEdit()
    
    var body: some View {
        VStack {
            HStack {
                game.cover
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 230)
                    
                VStack(alignment: .leading) {
                    Text(game.name)
                        .font(.system(size: 20, weight: .bold))
                    
                    Text(game.developer)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Text(progressGame().toProgressString())
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.blue)
                    
                    ProgressView(value: progressGame())
                }.padding(.leading, 10)
            }.padding()
            
            Button(action: {
                progressEdit.present(currentGameProgress: game.progress)
            }) {
                Text("Update progress")
                    .foregroundColor(.white)
                    .font(.title2)
                    .tracking(1)
            }.sheet(isPresented: $progressEdit.isUpdating) {
                ProgressEditorView(progressEdit: $progressEdit)
            }
            .frame(width: 220, height: 55)
            .background(Color.red)
            .cornerRadius(9)
    
            Spacer()
        }
    }
    
    func progressGame() -> Double {
        return progressEdit.progress != 0.0 ? progressEdit.progress : game.progress
    }
}

struct ProgressEditorView: View {
    @State private var progress: CGFloat = 0.0
    @Binding var progressEdit: ProgressEdit
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Current progress:")
                    .font(.title3)
                    .padding(.leading, 20)
                HStack {
                    Slider(value: $progressEdit.progress)
                    Text(progressEdit.progress.toProgressString())
                }.padding()
                Spacer()
            }
            .navigationBarItems(trailing: Button("Done",
                                                 action: {
                                                    progressEdit.isUpdating = false
                                                 }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: Game(name: "FIFA 20", developer: "Electronic Arts", cover: Image("fifa"), progress: 0.25))
    }
}
