//
//  ContentView.swift
//  W4-app1
//
//  Created by Sergiu Corbu on 4/6/21.
//

import SwiftUI
import Alamofire
import Kingfisher

struct ContentView: View {
    @State var result: String = ""
    var body: some View {
        
        Button(action: {
            AF.request("http://httpbin.org/get").response { response in
                print(response)
                if let data = response.data {
                    let dataString = String(data: data, encoding: .utf8)
                    result = dataString ?? "no response"
                }
            }
            
        }, label: {
            Text("Api call")
        })
        Text(result)
        KFImage(URL(string: "http://2.bp.blogspot.com/-e7iCNGuFIgw/UIUQFqPirCI/AAAAAAAAHk8/SOxE8ovnxic/s640/black_minimalistic_cats_green_eyes_background_desktop_1650x1080_hd-wallpaper-839041.png")!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
