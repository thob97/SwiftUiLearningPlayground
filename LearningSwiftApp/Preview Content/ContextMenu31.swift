//
//  ContextMenu31.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

import SwiftUI

//takeaway:
// 1. for showing options when long pressing an item
// 2. has predefined formatting -> only allows text&icon&subtitle
// (3. label can be used for interface items)
// 4. preview -> view can be used to show a preview (instead of the long pressed item) when long pressing (like in safari with new tabs)

struct ContextMenu31: View {
    let data: [String] = ["Save", "Remove", "Like"]
    
    var body: some View {
        //blue box
        VStack(alignment:.leading, spacing: 10){
            Image(systemName: "house.fill").font(.title2)
            Text("This is an item").font(.headline)
            Text("Hold me tight please").font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(20)
        .background(Color.blue)
        .cornerRadius(15)

        //contextMenue
        .contextMenu {
            Button {

            } label: {
                Label("Save", systemImage: "flame")
                Text("Subtitle")
            }

            Button("Delete", role: .destructive) {

            }

            Button("Like") {

            }
        }
//    preview: {
//          Text("Preview")
//        }
    }
}

struct ContextMenu31_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu31()
    }
}
