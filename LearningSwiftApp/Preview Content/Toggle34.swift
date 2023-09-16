//
//  Toggle34.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

import SwiftUI

//takeaways:
//1. can use .onChange()
//2. switch & button versions
//3. can be styled with tint

struct Toggle34: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack{
            
            Text("Status: \(toggleIsOn ? "Online" : "Offline")").font(.title)
            
            //simplest version
            Toggle("Simplest Version", isOn: $toggleIsOn)
                .tint(.red) //background color
                .foregroundColor(.red)
            
            //with custom label version
            Toggle(isOn: $toggleIsOn) {
                //Label("Text", systemImage: "square.and.arrow.up")
                HStack{
                    Text("With custom Label")
                    Image("test_star1").resizable().scaledToFit().frame(width: 40)
                }
            }
            
            //button version
            Toggle("Button", isOn: $toggleIsOn)
                .toggleStyle(.button)
                .tint(.green) //accent color
            
            //custom label toggle button
            Toggle(isOn: $toggleIsOn) {
                Image(systemName: "flame.fill")
            }
            .toggleStyle(.button)
            .tint(.red)
            
            
            Spacer()
        }.padding(.horizontal, 50)
    }
}

struct Toggle34_Previews: PreviewProvider {
    static var previews: some View {
        Toggle34()
    }
}
