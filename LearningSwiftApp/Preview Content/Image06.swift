//
//  Image06.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

//takeaways:
//1. change size of image (similar to icon): resizeable + (aspectRatio) + frame
//2. two ways for clipping
//3. if transparent -> can color image

struct Image06: View {
    var body: some View {
        Image("test_star1")
            
            //TODO: SIZE
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 200)
            .background(.red)
            
        
            //TODO: COLOR (if vector/transparent)
//            .renderingMode(.template) //has to be on top of code
//            .foregroundColor(.red)
        
            //TODO: CLIPPING to shape
            .clipped()
            //OR
//            .clipShape(
//                Circle()
//            )
    }
}

struct Image06_Previews: PreviewProvider {
    static var previews: some View {
        Image06().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
