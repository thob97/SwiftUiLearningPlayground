//
//  GeometryReader67.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 01.10.23.
//

import SwiftUI

//takeaways:
//1. use to get exact size and location of objects (works great with different orientations) (e.g. scrollview which animates object when in view)
//2. can be a little expensive (use only if really needed)
//3. geometry parameter provides: height, width, coordinates
struct GeometryReader67: View {
    
    private func calcPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2.0
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        //image item
                        AsyncImage(url: URL(string: "https://picsum.photos/400"), content: { phase in
                            switch phase{
                            case .success(let image):
                                image.resizable().scaledToFit()
                            default:
                                ProgressView()
                                    //center mid
                                    .frame(maxWidth: Double.infinity, maxHeight: Double.infinity, alignment: .center)
                                    .scaleEffect(2)
                                    
                            }
                        })
                            //animation effect
                            .rotation3DEffect(
                                Angle(degrees: calcPercentage(geo: geometry) * 20),
                                axis: (x: 0.0, y: 1.0, z:0.0)
                            )
                    }
                        .frame(width: 300, height: 300)
                        .padding()
                }
            }
        }
    }
}

struct GeometryReader67_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader67()
    }
}
