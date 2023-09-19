//
//  DarkMode41.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 18.09.23.
//

import SwiftUI

//takeaways:
//0. there are two predefined themes (dark & light) (more can be custom created... will do in later tutorial)
//1. some colours are adaptable (primary, secondary)
//2. explicit colours are static / not adaptable
//3. use "@Environment(\.colorScheme) var colorScheme" to get the devices colorScheme
//4. custom adaptable colours can be created:
//4.1 with the projects assets folder
//4.2 or with conditions and the environment colorScheme variable

struct DarkMode41: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            Text("Primary Colour")
                .foregroundColor(.primary)
            
            Text("Secondary Colour")
                .foregroundColor(.secondary)
            
            Text("Static Black")
                .foregroundColor(.black)
            
            Text("Static White")
                .foregroundColor(.white)
            
            Text("Custom with Conditions")
                .foregroundColor(colorScheme == .light ? .red : .yellow)
            
            Text("Custom with Assets Colour")
                .foregroundColor(Color("CustomAdaptableColour"))
        }
    }
}

struct DarkMode41_Previews: PreviewProvider {
    static var previews: some View {
        DarkMode41()
    }
}
