//
//  Frames07.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

//takeaway:
//1. use .infinity or UIScreen.main.bounds.height for maximum space
//2. use max space or spacer for alignment
//3. frame has a alignment property

struct Frames07: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(.red)
            .frame(height: 100, alignment: .top)
            .background(.orange)
            .frame(width: 150)
            .background(.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.red)
            .frame(maxHeight: 400)
            .background(.green)
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height, alignment: .top)
            .background(.yellow)
            
    }
}

struct Frames07_Previews: PreviewProvider {
    static var previews: some View {
        Frames07().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
