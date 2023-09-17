//
//  Icons05.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

//takeaways:
//1. change size of icon: with font, or resizeable + aspectRatio + frame (opt: clipped)
//2. there are three versions: hierarchical(tint), multicolor(pre defined), pallet(custom)

struct Icons05: View {
    var body: some View {
        Image(systemName: "cloud.sun.rain.fill")
            //TODO: change size with font:
            //.font(.system(size: 34))
        
            //TODO: or change size with
            ///allows icon to resize to max box boundaries
            .resizable()
            ///fill or fit icon to box
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 100)
        
            //TODO: will cut anything out of box
            //useful when aspectRation == fill
            .clipped()
            
            //TODO: for palette color icons (for 3 definable colors)
//            .symbolRenderingMode(.palette)
//            .foregroundStyle(.blue,.orange, .red)
            
            //TODO: for multicolor (pre defined color)
//            .symbolRenderingMode(.multicolor)
        
            //TODO: for hierarchical color (one color auto map)
//            .symbolRenderingMode(.hierarchical)
//            .foregroundStyle(Color.purple)   
    }
}

struct Icons05_Previews: PreviewProvider {
    static var previews: some View {
        Icons05().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
