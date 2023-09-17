//
//  Gradient04.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

//takeaways:
//1. there are 4 types of gradient
//2. they are highly customisable

struct Gradient04: View {
    var body: some View {
        VStack(spacing:10){
            //1.
            Rectangle()
                .fill(
                    EllipticalGradient(
                        colors:[Color.blue, Color.green],
                        center: .center,
                        startRadiusFraction: -0.1,
                        endRadiusFraction: 0.5
                    )
                )
                .frame(width: 200, height: 200)
            
            //2.
            Rectangle()
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [Color.red, Color.blue]),
                        center: .center,
                        angle: .degrees(45)
                    )
                   
                )
                .frame(width: 200, height: 200)
            
            //3.
            Rectangle()
                .fill(
                    RadialGradient(
                        colors: [.brown,.blue],
                        center: .center,
                        startRadius: 5,
                        endRadius: 400
                    )
                )
                .frame(width: 200, height: 200)
            
            //4.
            Rectangle()
                .fill(
                    LinearGradient(
                        //colors: [.red, .black],
                        stops: [.init(color: .red, location: 0.4), .init(color: .blue, location: 0.5)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 200, height: 200)
        }
    }
}

struct Gradient04_Previews: PreviewProvider {
    static var previews: some View {
        Gradient04().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
