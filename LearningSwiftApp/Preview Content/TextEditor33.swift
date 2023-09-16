//
//  TextEditor33.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

import SwiftUI

//takeaways
//1. like textfields but multiline
//2. less customizable -> use textfields when possible
//3. has by default max width and height of intinity
struct TextEditor33: View {
    init() {
        UITextView.appearance().backgroundColor = .clear //for clear background < iOS 15
    }
    
    var body: some View {
        TextEditor(text: .constant("Placeholder"))
            .font(.title)
            .scrollContentBackground(.hidden) //for clear background > iOS 15
            .foregroundColor(.yellow)
            .background(.blue)
            .frame(height: 500)
    }
}

struct TextEditor33_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor33()
    }
}
