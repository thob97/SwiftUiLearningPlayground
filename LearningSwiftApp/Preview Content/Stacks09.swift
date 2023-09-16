//
//  Stacks09.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

struct Stacks09: View {
    var body: some View {
        ZStack (alignment:.top,content:{
            Rectangle()
                .frame(width: 400, height: 600)
                .foregroundColor(.yellow)
            
            VStack(alignment:.leading, spacing: 20 ,content: {
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.red)
                
                Rectangle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.green)
                
                HStack (alignment:.bottom ,content:{
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.purple)
                    
                    Rectangle()
                        .frame(width: 130, height: 80)
                        .foregroundColor(.red)
                    
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                })
                .background(.white)
            })
            .background(.black)
                
        })
    }
}

struct Stacks09_Previews: PreviewProvider {
    static var previews: some View {
        Stacks09().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
