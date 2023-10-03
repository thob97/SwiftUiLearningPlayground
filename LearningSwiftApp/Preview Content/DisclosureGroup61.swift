//
//  DisclosureGroup61.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 30.09.23.
//

import SwiftUI

//takeaways:
//1. looks like a single listview item
//2. provides hide button
//3. can have a binding (but removes elapse "animation")
//4. label and content can be any view

struct DisclosureGroup61: View {
    @State var show: Bool = false
    var body: some View {
        VStack {
            DisclosureGroup(isExpanded: $show) {
                VStack{
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
                    Button("Hide") {
                        show.toggle()
                    }
                }
            } label: {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("DisclosureGroup").font(.title.bold())
                    Image(systemName: "heart.fill")
                }
            }.padding()
            Spacer()
        }
    }
}

struct DisclosureGroup61_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroup61()
    }
}
