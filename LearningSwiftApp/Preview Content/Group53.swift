//
//  Group53.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 21.09.23.
//

//takeaways:
//1. like a Z,H,V Stack but without changing the layout of the items
//2. -> used when you want to use .modifiers on all the grouped items

import SwiftUI

struct Group53: View {
    var body: some View {
        VStack {
            Group {
                Text("Is in Group")
                Text("Is in Group2")
            }
            .foregroundColor(.blue)
            .font(.headline)
            .frame(width: 150, height: 75)
            .background(.green.opacity(0.2))
            .cornerRadius(20)
            
            Text("Is not in Group")
        }
    }
}

struct Group53_Previews: PreviewProvider {
    static var previews: some View {
        Group53()
    }
}
