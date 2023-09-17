//
//  SafeArea17.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

//takeaway:
//1. in this case auto handled by swiftUI

struct SafeArea17: View {
    var body: some View {
        Text("Hello, World!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            //.ignoresSafeArea()
            
            
    }
}

struct SafeArea17_Previews: PreviewProvider {
    static var previews: some View {
        SafeArea17().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
