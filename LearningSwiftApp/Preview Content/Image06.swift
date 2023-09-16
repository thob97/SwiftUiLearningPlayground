//
//  Image06.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

struct Image06: View {
    var body: some View {
        Image("test_star1")
            
            //TODO: SIZE
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            
        
            //TODO: COLOR
//            .renderingMode(.template) //has to be on top
//            .foregroundColor(.red)
            
            //TODO: CLIPPING to shape
//            .clipped()
//            .cornerRadius(360)
            //OR
            .clipShape(
                Circle()
            )
    }
}

struct Image06_Previews: PreviewProvider {
    static var previews: some View {
        Image06().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
