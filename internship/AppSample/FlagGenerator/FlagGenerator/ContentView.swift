import SwiftUI

let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width

struct ContentView: View {
    
    @State private var hTapped = false
    @State private var vTapped = false
    @State private var addStripePressed: Bool = false
    @State private var commitPressed: Bool = false
    
    @ObservedObject var viewModel = ViewModel()
    
    var flag: Flag {
        return viewModel.flag
    }
    
    var body: some View {
        
        VStack {
            VStack {
                VStack {
                    HStack(spacing: 0){ //add spacing 0
                        ForEach(0..<flag.components.count, id: \.self) { index in
                            let _flag = flag.components[index]
                            StripeView(stripe: _flag)
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
                    
                    SubsectionView(HTapped: $hTapped, VTapped: $vTapped)
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

struct Stripe {
    var color: Color = Color.red
    var image: String?
}

struct StripeView: View {
    let stripe: Stripe
    //var orientation: Bool
    var body: some View {
        Rectangle()
            .foregroundColor(stripe.color)
            .overlay(Image(stripe.image ?? "")
                        .resizable()
                        .frame(width: 45, height: 45))
    }
}

struct Flag {
    var components: [Stripe] = []
}

class ViewModel: ObservableObject {
    @Published var flag: Flag = Flag()
    
    func add(item: Stripe) {
        flag.components.append(item)
    }
    
    func setColor(color: Color, index: Int) {
        flag.components[index].color = color
    }
    func setImage(image: String, index: Int) {
        flag.components[index].image = image
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View {
    func viewProperties () -> some View {
        self
            .padding(.top, 15)
            .padding(.bottom, 25)
            .background(Color.white)
            .cornerRadius(15)
    }
}
extension Color {
    static let deepBlue = Color("deep blue")
}
extension Text {
    func textProperties () -> some View {
        self
            .foregroundColor(.white)
            .font(.title2)
            .bold()
            .tracking(1)
    }
}
extension Button {
    func addStripeProperties () -> some View {
        self
            .frame(width: width - 120, height: 40)
            .padding([.top, .bottom], 10)
            .background(Color.blue)
            .cornerRadius(10.0)
            .padding(.top, 20)
    }
    
    func commitProperties () -> some View {
        self
            .frame(width: width - 120, height: 40)
            .padding([.top, .bottom], 10)
            .background(Color.green)
            .cornerRadius(10.0)
            .padding(.top, 7)
    }
}
