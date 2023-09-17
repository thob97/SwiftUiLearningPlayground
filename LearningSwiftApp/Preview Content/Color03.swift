//
//  Color03.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

//takeaways:
//1. color & shadow are widely used
//2. most often with: background, foregroundColor, fill, tint (==colorScheme)

struct Color03: View {
    var body: some View {
        Rectangle()
            .fill(
                //.primary
                Color("CustomBackgroundColor")
            )
            .shadow(
                color: .red.opacity(0.5),
                radius: 20,
                x: 20,
                y:50
            )
            .frame(width: 100, height: 200)
    }
}

struct Color03_Previews: PreviewProvider {
    static var previews: some View {
        Color03()
    }
}
