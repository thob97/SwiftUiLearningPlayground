//
//  Shapes02.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

struct Shapes02: View {
    var body: some View {
        //Circle()
        //Capsule()
        //Rectangle()
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)  , style: .continuous)
            .trim(from: 0.4, to: 1)
            .stroke(style: StrokeStyle(lineWidth: 10))
            .foregroundColor(.red)
            //.fill(.mint)
            .frame(width: 200, height: 100)
    }
}

struct Shapes02_Previews: PreviewProvider {
    static var previews: some View {
        Shapes02().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
