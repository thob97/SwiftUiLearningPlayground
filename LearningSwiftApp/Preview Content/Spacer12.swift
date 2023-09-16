//
//  Spacer12.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.08.23.
//

import SwiftUI

struct Spacer12: View {
    var body: some View {
        VStack{
            HStack(spacing:0){
                Image(systemName: "cross")
                    .font(.title)
                
                Spacer(minLength: 0)
                    .frame(height: 10)
                    .background(.green)
                
                Image(systemName: "gear")
                    .font(.title)
            }
            .background(.yellow)
            .padding(.horizontal)
            .background(.blue)
            
            Spacer()
                .frame(width: 10)
                .background(.green)
        }
        
    }
}

struct Spacer12_Previews: PreviewProvider {
    static var previews: some View {
        Spacer12().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
