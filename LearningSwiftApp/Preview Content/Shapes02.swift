//
//  Shapes02.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

//takeaways:
//1. there are multiple shapes: circle, capsule, rectangle, roundedRectangle
//2. they are highly customisable
//3. .clipShape can be useful (.clipShape(Circle()))

struct Shapes02: View {
    var body: some View {
        VStack(spacing:100){
            Circle()
                .trim(from: 0.4, to: 1)
                .fill(.mint)
                .frame(width: 200, height: 100)
            
            Capsule()
                .stroke(style: StrokeStyle(lineWidth: 10))
                .foregroundColor(.red)
                .frame(width: 200, height: 100)
            
            Rectangle()
                .stroke(style: StrokeStyle(
                    lineWidth: 20,
                    dash: [50],
                    dashPhase: 5
                ))
                .frame(width: 200, height: 100)
            
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)  , style: .continuous)
                .trim(from: 0.4, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 10))
                .foregroundColor(.red)
                //.fill(.mint)
                .frame(width: 200, height: 100)
        }
    }
}

struct Shapes02_Previews: PreviewProvider {
    static var previews: some View {
        Shapes02().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
