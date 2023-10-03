//
//  ShareLink66.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 01.10.23.
//

import SwiftUI

//takeaways:
//1. label can be any view
//2. item, subject, message are parameters which will/might be shared to the next app
//3. SharePreview can be used to create a somewhat more custom preview

struct ShareLink66: View {
    var body: some View {
        VStack{
            ShareLink(
                item: "Item: will be passed",
                subject: Text("Subject: might be passed"),
                message: Text("Message: will be shown on share view & passed"),
                preview: SharePreview("SharePreview", image: Image("test_star2"), icon: Image(systemName: "heart")),
                label: {
                    VStack{
                        Text("Label Can be any View")
                        Image(systemName: "flame")
                    }
                }
            )
            Spacer()
        }
    }
}

struct ShareLink66_Previews: PreviewProvider {
    static var previews: some View {
        ShareLink66()
    }
}
