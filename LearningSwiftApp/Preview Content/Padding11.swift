//
//  Padding11.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.08.23.
//

import SwiftUI

///takeaway: padding is usefull as its more adaptive than a fixed size
struct Padding11: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text("This is the description of what we will do on this screnn. It is multiple lines and we will align the text to the leading edge.")
        }
        ///padding (<-text->)
        .padding()
        .background(.white)
        .cornerRadius(8)
        ///padding (<-white card background->)
        .padding()
        .shadow(color: .black.opacity(0.5), radius:10, x: 5, y: 10)
        
    }
}

struct Padding11_Previews: PreviewProvider {
    static var previews: some View {
        Padding11().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
