//
//  onTabGesture44.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 19.09.23.
//

import SwiftUI

//takeaways:
//1. like button but a modification -> can be used on any already existing view
//2. has no highlighted state (animation) like button has
//3. has option: count (count=2 just as the instagram like function)

struct onTabGesture44: View {
    @State var backgroundC: Color = .blue.opacity(0.3)
    
    var body: some View {
        ZStack {
            //background
            backgroundC.ignoresSafeArea()
            
            VStack{
                Button {
                    //do smth
                    backgroundC = .blue.opacity(0.3)
                } label: {
                    Text("Button")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 75)
                        .background(.blue)
                        .cornerRadius(20)
                        .padding()
                    
                }
                
                Text("TapGesture")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 75)
                    .background(.blue)
                    .cornerRadius(20)
                    .padding()
                    .onTapGesture(count: 1) {
                        //do smth
                        backgroundC = .green.opacity(0.3)
                    }
            }
        }
    }
}

struct onTabGesture44_Previews: PreviewProvider {
    static var previews: some View {
        onTabGesture44()
    }
}
