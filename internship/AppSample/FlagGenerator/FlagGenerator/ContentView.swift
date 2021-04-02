import SwiftUI

let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width

struct ContentView: View {
    @State private var Htapped = false
    @State private var VTapped = false
    @State private var StripebuttonPressed: Bool = false
    @State private var CommitbuttonPressed: Bool = false
    
    @ObservedObject var flag = Flag()
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    HStack{ //add spacing 0
                        ForEach(0..<flag.components.count, id: \.self) { rect in
                            flag.components[rect]
                        }
                    }
                   
                }
                .frame(width: 220, height: 130)
                .background(Color(UIColor.systemGray6))
            }
            .frame(width: width, height: 250)
            .background(Color.white)
            .edgesIgnoringSafeArea(.top)
            
            VStack {
                if StripebuttonPressed {
                    Options()
                        .viewProperties()
                }
                Subsection(HTapped: $Htapped, VTapped: $VTapped)
                    .viewProperties()
                
                if Htapped {
                    Button(action: {
                        flag.add(item: Stripe(color: Color.red, image: ""))
                    }, label: {
                        Text("Add Stripe")
                            .textProperties()
                    })
                    .addStripeProperties()
                    
                    Button(action: {
                    }, label: {
                        Text("Commit Section")
                            .textProperties()
                    })
                    .commitProperties()
                }
                
               else if VTapped {
                    if !Htapped {
                        Button(action: {
                            flag.add(item: Stripe(color: Color.blue, image: ""))
                        }, label: {
                            Text("Add Stripe")
                                .textProperties()
                        })
                        .addStripeProperties()
                        
                        Button(action: {
                        }, label: {
                            Text("Commit Section")
                                .textProperties()
                        })
                        .commitProperties()
                    }
                    
                }
            } // 2nd vstack
            .padding(.top, -25)
            
            
            Spacer()
        }// main vstack
        .background(Color(UIColor.systemGray5))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Stripe: View {
    var color: Color
    var image: String?
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .overlay(Image(image ?? "")
                        .resizable()
                        .frame(width: 45, height: 45))
    }
}

class Flag: ObservableObject {
    @Published var components: [Stripe] = []
    
    func add(item: Stripe) {
        components.append(item)
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
            .padding(.top, 25)
            .padding(.bottom, 35)
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
            .frame(width: width - 100, height: 50)
            .padding([.top, .bottom], 10)
            .background(Color.blue)
            .cornerRadius(12.0)
    }
    
    func commitProperties () -> some View {
        self
            .frame(width: width - 100, height: 50)
            .padding([.top, .bottom], 10)
            .background(Color.green)
            .cornerRadius(10.0)
    }
}

