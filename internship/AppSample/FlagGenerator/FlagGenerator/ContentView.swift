import SwiftUI

let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width

struct ContentView: View {
    @State private var Htapped = false
    @State private var VTapped = false
    @State private var StripebuttonPressed: Bool = false
    @State private var CommitbuttonPressed: Bool = false
    
    var body: some View {
        VStack {
            
            VStack {
                VStack {
                    
                }
                .frame(width: 220, height: 130)
                .background(Color.yellow)
            }
            .frame(width: width, height: 300)
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
                    CustomButton(buttonPressed: $StripebuttonPressed, text: "Add Stripe", color: Color.blue)
                        .padding(.top, 10)
                    
                    CustomButton(buttonPressed: $CommitbuttonPressed, text: "Commit Section", color: Color.green)
                }
                else if VTapped {
                    if !Htapped {
                        CustomButton(buttonPressed: $StripebuttonPressed, text: "Add Stripe", color: Color.blue)
                            .padding(.top, 10)
                        
                        CustomButton(buttonPressed: $CommitbuttonPressed,text: "Commit Section", color: Color.green)
                    }
                    
                }
            } // 2nd vstack
            .padding(.top, -25)
            Spacer()
        } // main vstack
        .background(Color(UIColor.systemGray5))
        .edgesIgnoringSafeArea(.bottom)
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
