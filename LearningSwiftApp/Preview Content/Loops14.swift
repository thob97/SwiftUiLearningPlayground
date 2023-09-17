//
//  Loops14.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.08.23.
//

import SwiftUI

//takeaway:
//1. the ForEach loop is useful for generating multiple views with similarities
//2. it can iterate over a range or data (but then also needs the id property)

struct Loops14: View {
    let liste: [String] = ["Hey", "Hoh", "Hi"]
    
    var body: some View {
        VStack {
            
            ForEach(1..<5) { index in
                Text("\(index)")
            }
            
            ForEach(0..<liste.count, id: \.self) { index in
                Text("\(liste[index]): \(index)")
            }
            
            ForEach(liste.indices, id: \.self) { index in
                Text("\(liste[index]): \(index)")
            }
        }
    }
}

struct Loops14_Previews: PreviewProvider {
    static var previews: some View {
        Loops14().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
