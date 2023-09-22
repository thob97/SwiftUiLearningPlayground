//
//  Spacer12.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.08.23.
//

import SwiftUI

//takeaway:
//1. spacer are useful for aligning other views in a stack (to center, to top, to bottom, ...)
//2. has minLength option, found no way to scale spacers like in flutter (Spacer(flex))
//3. dividers are oriented in the opposite way, and are used to visualise a divisions between views. It will also, just like spacer, try to get as much height or width as possible

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
            
            VStack {
                Text("Hey")
                Divider()
                Text("Ho")
            }
        }
    }
}

struct Spacer12_Previews: PreviewProvider {
    static var previews: some View {
        Spacer12().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
