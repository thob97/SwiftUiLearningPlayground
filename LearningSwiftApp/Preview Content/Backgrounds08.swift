//
//  Backgrounds08.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.08.23.
//

import SwiftUI

struct Backgrounds08: View {
    var body: some View {
        //hearth
        Image(systemName: "heart.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
        
            //blue background
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.cyan, .cyan.opacity(0.6)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: .cyan, radius: 10, x: 5, y: 5)
                
                    //purple overlay
                    .overlay(
                        alignment:.bottomTrailing,
                        content: {
                            Circle()
                                .fill(.purple)
                                .frame(width: 30, height: 30)
                                .shadow(
                                    color: .purple.opacity(0.5),
                                    radius: 10, x:5, y:5
                                )
                            
                                //5 overlay
                                .overlay(content: {
                                    Text("5")
                                        .foregroundColor(.white)
                                })
                        })
            )
    }
}

struct Backgrounds08_Previews: PreviewProvider {
    static var previews: some View {
        Backgrounds08().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
