//
//  Icons05.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

//takeaways:
//1. change size of icon with:
// 1.1 (dynamic) font(system-font)
// 1.2 (fixed): resizeable() + frame()
// 1.3 (flexible): resizeable() + aspectRatio(2/3, mode)
// 1.4 (flexible): font(fixed) + minimumScaleFactor(double)(if to big, scale down until)
// 1.5 opt: imageScale(), clipped()
//2. there are three versions: hierarchical(tint), multicolor(pre defined), pallet(custom)

struct Icons05: View {
    
    func myImage() -> some View{
        return Image(systemName: "cloud.sun.rain.fill")
        //TODO: change size with font:
        //.font(.system(size: 34))
    
        //TODO: or change size with
        ///allows icon to resize to max box boundaries
        .resizable()
        ///fill or fit icon to box
        .aspectRatio(contentMode: .fit)
        //.frame(width: 80, height: 100)
    
        //TODO: will cut anything out of box
        //useful when aspectRation == fill
        .clipped()
    }
    
    var body: some View {
        ZStack {
            //Background
            Color.gray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 50) {
                myImage()
                
                //TODO: for palette color icons (for 3 definable colors)
                myImage()
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.purple,.red, .green)
                
                //TODO: for multicolor (pre defined color)
                myImage()
                    .symbolRenderingMode(.multicolor)
                
                //TODO: for hierarchical color (one color auto map)
                myImage()
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.purple)
            }
        }
    }
}



struct Icons05_Previews: PreviewProvider {
    static var previews: some View {
        Icons05().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
