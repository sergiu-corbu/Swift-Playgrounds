//
//  Extensions.swift
//  FlagGenerator
//
//  Created by Sergiu Corbu on 4/6/21.
//

import Foundation
import SwiftUI

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
            .background(Color.deepBlue)
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


struct VLine: View {
    
    var body: some View {
        HStack {
            Rectangle()
                .vProperties()
            Rectangle()
                .vProperties()
                .padding(.leading, -4)
                .padding(.trailing, 55)
        }
    }
}
struct HLine: View {
    var body: some View {
        VStack {
            Rectangle()
                .hProperties()
            Rectangle()
                .hProperties()
                .padding(.top, -4)
        }
        .padding(.leading, 55)
    }
}

struct SmallVLine: View {
    
    var body: some View {
        HStack {
            Rectangle()
                .vProperties()
            Rectangle()
                .vProperties()
                .padding(.leading, -5)
        }
    }
}
struct SmallHLine: View {
    var body: some View {
        VStack {
            Rectangle()
                .hProperties()
            
            Rectangle()
                .hProperties()
                .padding(.top, -5)
        }
    }
}

extension Rectangle {
    func vProperties() -> some View {
        self
            .foregroundColor(.deepBlue)
            .frame(width: 13, height: 30)
    }
    
    func hProperties() -> some View {
        self
            .foregroundColor(.deepBlue)
            .frame(width: 30, height: 13)
    }
}

