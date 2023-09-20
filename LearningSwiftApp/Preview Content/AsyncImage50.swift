//
//  AsyncImage.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 20.09.23.
//

import SwiftUI

//takeaways:
//1. to easily download (async) images
//2. has different constructors, -> one is just like in flutter
//(3. is auto cashing images)

struct AsyncImage50: View {
    
    @State var url: URL? = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch(phase){
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(40)
            case .failure:
                Image(systemName: "questionmark")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            @unknown default:
                fatalError()
            }
        }.onTapGesture {
            let random = [200,300,400,500,600,700,800,100,-100,-100].randomElement()
            url = URL(string: "https://picsum.photos/\(random ?? 600)")
        }
    }
}

struct AsyncImage50_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage50()
    }
}
