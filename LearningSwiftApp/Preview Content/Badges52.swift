//
//  Badges52.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 21.09.23.
//

import SwiftUI

//takeaways:
//1. work on lists or tabbars(TabView)

struct Badges52: View {
    var body: some View {
        TabView {
            List{
                Text("Hey")
                Text("This")
                Text("Is")
                Text("A")
                Text("List")
                Text("Badge --->")
                    .badge("NEW ITEMS") //<-----
            }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .badge("NEW") //<-----
            
            Color.gray
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .badge(5) //<-----
        }
    }
}

struct Badges52_Previews: PreviewProvider {
    static var previews: some View {
        Badges52()
    }
}
