import SwiftUI

let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width

struct ContentView: View {
    
    @State private var hTapped = false
    @State private var vTapped = true
    @State private var addStripePressed: Bool = false
    @State private var commitPressed: Bool = false
    @ObservedObject var viewModel = StripeViewModel()
    
    var flag: Flag {
        return viewModel.flag
    }
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    if hTapped {
                    HStack(spacing: 0) {
                        ForEach(0..<flag.components.count, id: \.self) { index in
                            let _flag = flag.components[index]
                            StripeView(stripe: _flag)
                        }
                    }
                    } else if vTapped {
                        VStack(spacing: 0) {
                            ForEach(0..<flag.components.count, id: \.self) { index in
                                let _flag = flag.components[index]
                                StripeView(stripe: _flag)
                            }
                    }
                    }
                }
                .frame(width: 220, height: 140)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5)
            }
            .frame(width: width, height: 200)
            .background(Color.white)
            .padding(.bottom, 10)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if addStripePressed {
                        ForEach(0..<flag.components.count, id: \.self) { index in
                            OptionsView(viewModel: viewModel, index: index)
                                .viewProperties()
                        }
                    }
                    
                    AddSubsectionView(HTapped: $hTapped, VTapped: $vTapped)
                        .viewProperties()
                    
                    if hTapped {
                        Button(action: {
                            addStripePressed = true
                            viewModel.add(item: Stripe())
                        }, label: { Text("Add Stripe")
                            .textProperties() }) .addStripeProperties()
                        
                        Button(action: {
                                addStripePressed = false }, label: { Text("Commit Section")
                                    .textProperties()}) .commitProperties()
                    } else if vTapped {
                        Button(action: {
                            addStripePressed = true
                            viewModel.add(item: Stripe())
                        }, label: { Text("Add Stripe")
                            .textProperties() }) .addStripeProperties()
                        
                        Button(action: {
                                addStripePressed = false }, label: { Text("Commit Section")
                                    .textProperties()}) .commitProperties()
                    }
                    
                } // 2nd vstack
                Spacer()
            }// main vstack
            .background(Color(UIColor.systemGray5))
            //.edgesIgnoringSafeArea(.all)
        }
        .background(Color(UIColor.systemGray5))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
