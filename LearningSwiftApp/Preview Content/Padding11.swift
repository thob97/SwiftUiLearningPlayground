//
//  Padding11.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.08.23.
//

import SwiftUI

//takeaway:
//1. padding is useful as its more adaptive than a fixed size
//2. padding tries to push away other objects; if this doesn't work due to boundaries, it compresses itself / gets pushed inwards

struct Padding11: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("Hello, World!")
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
