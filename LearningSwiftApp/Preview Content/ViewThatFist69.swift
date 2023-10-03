//
//  ViewThatFist69.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 01.10.23.
//

import SwiftUI

//takeaways:
//1. automatically chooses the best fitting (size) view and of its children (order matters from first to last)
//2. (useful for different button styles for small or big phones, for different orientations, for enabled or disabled scrollview) https://youtu.be/HLslf5ol0nc?si=GphDT23cIa9CCPWp

struct ViewThatFist69: View {
    var body: some View {
        ViewThatFits {
            VStack{items.foregroundColor(.red.opacity(0.7))}
            HStack{items.foregroundColor(.blue.opacity(0.3))}
        }
    }
    
    var items: some View = ForEach(0..<3){ _ in
            RoundedRectangle(cornerRadius: 20.0)
                //.fill(.blue.opacity(0.3))
                .frame(width: 200, height: 200)
                .padding()
    }
}

struct ViewThatFist69_Previews: PreviewProvider {
    static var previews: some View {
        ViewThatFist69()
    }
}
