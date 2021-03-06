//
//  ContentView.swift
//  Demo
//
//  Created by Sergiu Corbu on 3/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var toggler: Bool = false
    @State private var tipOption = 0 // no tip at first
    @State private var total: Int = 0
    @State private var nrofPeople = ""
    @State private var showSheet = false
    
    let options = [0, 10, 15, 20]
    
    var totalForOnePerson: Double{
        let peopleCount = Double(nrofPeople) ?? 0
        let tipSelection = Double(options[tipOption])
        let amount = Double(total)
        let tipValue = (amount / 100) * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double{
        let tipSelection = Double(options[tipOption])
        let amount = Double(total) ?? 0
        let tipValue = (amount / 100) * tipSelection
        let grandTotal = amount + tipValue
        
        return grandTotal
        
    }
    var body: some View{
        ScrollView{
            HStack{
                Text("Tip calculator")
                    .font(.title2)
                    .foregroundColor(.purple)
                    .shadow(radius: 10)
                    .padding(.top, 35)
            }.padding(.bottom, 30)
            
            VStack{
                HStack{
                    Text("Final amount: ")
                    
                    TextField("Enter the final amount", text: Binding<String>(get: { return String(total)}, set: { newValue in
                        self.total = Int(newValue) ?? 0
                    }))
                }
                
                HStack{
                    Text("Number of people")
                    TextField("Number of people", text: $nrofPeople )
                    
                }.padding(.bottom, 10)
                Divider()
                
                Toggle("Do you want to add a tip?", isOn: $toggler)
                
                if toggler{
                    Text("How much percentage do you want to leave?")
                        .font(.callout)
                        .padding(.bottom, -5)
                    
                    Picker("Tip percentage", selection: $tipOption){
                        
                        ForEach(0..<options.count) {
                            Text("\(self.options[$0]) % ")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 20)
                }
                
                HStack{
                    Text("Total for one person: ")
                    Text("\(totalForOnePerson, specifier: "%.2f") $")
                        .foregroundColor(.yellow)
                    Spacer()
                }
                .padding(.bottom, 10)
                
                HStack{
                    Text("Grand total: ")
                    Text("\(totalAmount, specifier: "%.2f") $")
                        .foregroundColor(.purple)
                    Spacer()
                }
                .padding(.bottom, 20)
                
                HStack{
                    Spacer()
                    Button(action: { self.showSheet.toggle() }){
                        Text("Pay now")
                            .sheet(isPresented: $showSheet) {
                                sheetView(showSheet: self.$showSheet)
                            }
                    }
                    .frame(width: 120, height: 40) .foregroundColor(.white) .font(.headline) .background(Color.red) .cornerRadius(15)
                    Spacer()
                }
            }
            .padding(25)
        } // scroll end
        .background(Color.orange)
        .edgesIgnoringSafeArea(.all)
    }
}

struct sheetView: View{
    
    @Binding var showSheet: Bool
    
    var body: some View{
        NavigationView{
            Text("Transaction completed")
                .font(.title2)
                .foregroundColor(.orange)
                .navigationBarItems(trailing: Button(action: { self.showSheet = false }) {
                    Text("Done").bold()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
