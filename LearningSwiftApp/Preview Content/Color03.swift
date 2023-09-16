//
//  Color03.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

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
