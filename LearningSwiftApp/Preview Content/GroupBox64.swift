//
//  GroupBox64.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 30.09.23.
//

import SwiftUI

//takeaways:
//1. similair to a vStack (yes, despite its name it differs from normal group() view), as it lets you placed multiple childs in it
//2. with the addition: that it adds a dynamic background to visually distinguish its content from the rest of the view -> can be nested to see it clearly
//3. can have optional label

struct GroupBox64: View {
    var body: some View {
        GroupBox("Optional: Label") {
            Label("Item", systemImage: "star")
            GroupBox {
                Text("Nested")
            }
        }.padding()
    }
}

struct GroupBox64_Previews: PreviewProvider {
    static var previews: some View {
        GroupBox64()
    }
}
