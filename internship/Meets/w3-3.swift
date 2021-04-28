////
////  ContentView.swift
////  W3-3
////
////  Created by Lorena Astalis on 02.04.2021.
////
//
//import SwiftUI
//
//struct StopWatch {
//    var time: Int = 0
//}
//
//class StopWatchViewModel: ObservableObject {
//    // var stopWatch: StopWatch = StopWatch()
//    @Published var stopWatch: StopWatch = StopWatch()
//
//    func increment() {
//        stopWatch.time += 1
//        // self.objectWillChange.send()
//    }
//}
//
//struct StopWatchView: View {
//    // @ObservedObject var viewModel: StopWatchViewModel
//    @State var stopWatch: StopWatch = StopWatch()
//
//    var body: some View {
//        VStack {
//            Text("\(stopWatch.time)")
//                .font(.largeTitle)
//                .padding()
//            HStack {
//                Button("Increment") {
//                    // viewModel.increment()
//                    stopWatch.time += 1
//                }
//                Button("Stop") {
//
//                }
//                Button("Play") {
//
//                }
//            }
//        }
//    }
//
//}
//
//struct ContentView: View {
//
//
//    var body: some View {
//        VStack {
//            StopWatchView()
//            StopWatchView()
//            StopWatchView()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//
//  ContentView.swift
//  W3-3
//
//  Created by Lorena Astalis on 02.04.2021.
//

import SwiftUI

struct StopWatch {
    var time: Int = 0
}

class StopWatchViewModel: ObservableObject {
    // var stopWatch: StopWatch = StopWatch()
    @Published var stopWatch: StopWatch = StopWatch()
    var isRunning: Bool = false
    
    func increment() {
        stopWatch.time += 1
        // self.objectWillChange.send()
    }
    
    func play() {
        isRunning = true
        self.increment()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.isRunning {
                self.play()
            }
        }
    }
    
    func stop() {
        isRunning = false
    }
}

struct StopWatchView: View {
    @StateObject var viewModel: StopWatchViewModel = StopWatchViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.stopWatch.time)")
                .font(.largeTitle)
                .padding()
            HStack {
                Button("Increment") {
                    viewModel.increment()
                }
                Button("Stop") {
                    viewModel.stop()
                }
                Button("Play") {
                    viewModel.play()
                }
            }
        }
    }

}

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            StopWatchView()
            StopWatchView()
            StopWatchView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

