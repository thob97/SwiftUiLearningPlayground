//
//  SafeArea17.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

///takeaway: ignoreSafeArea mostly only in background, most of the time auto handled by swiftui
struct SafeArea17: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red.ignoresSafeArea())
            
            
    }
}

struct SafeArea17_Previews: PreviewProvider {
    static var previews: some View {
        SafeArea17().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
