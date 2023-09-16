//
//  Gradient04.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

struct Gradient04: View {
    var body: some View {
        Rectangle()
            .fill(
//                LinearGradient(
//                    //colors: [.red, .black],
//                    stops: [.init(color: .red, location: 0.4), .init(color: .blue, location: 0.5)],
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                RadialGradient(
//                    colors: [.brown,.blue],
//                    center: .center,
//                    startRadius: 5,
//                    endRadius: 400
//                )
//                AngularGradient(
//                    gradient: Gradient(colors: [Color.red, Color.blue]),
//                    center: .center,
//                    angle: .degrees(45)
//                )
                EllipticalGradient(
                    colors:[Color.blue, Color.green],
                    center: .center,
                    startRadiusFraction: -0.1,
                    endRadiusFraction: 0.5
                )
            )
            .frame(width: 400, height: 500)
    }
}

struct Gradient04_Previews: PreviewProvider {
    static var previews: some View {
        Gradient04().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
