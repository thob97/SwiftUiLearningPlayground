//
//  AsyncLet100.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 02.10.23.
//

import SwiftUI

//takeaways:
//1. lets you run multiple async calls at once (in a single task)
//2. lets you wait for them until !all of them! are finished
//3. use async let ... to get a return from running async code without awaiting
//4. use (var1, var2, ...) = await (try, try, ...) to wait for async vars / funcs until all are finished
//5. use for small groups of calls -> as not very scaleable -> for many multiple running async functions use taskGroup

struct AsyncLet70: View {
    @State var images1: [UIImage] = []
    @State var images2: [UIImage] = []
    
    var body: some View {
        NavigationStack{
            ScrollView {
                Text("Run and display one after another")
                HStack{
                    ForEach(images1, id: \.self){ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(height: 200)
                    }
                }
                
                Text("Run and display at the same time")
                HStack{
                    ForEach(images2, id: \.self){ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(height: 200)
                    }
                    
                }
            }.navigationTitle("Async Let")
                .onAppear{
                    
                    //Run and display one after another
                    Task{
                        if let image = try? await fetchImage(){
                            self.images1.append(image)
                        }
                        if let image = try? await fetchImage(){
                            self.images1.append(image)
                        }
                    }
                    
                    //Run and display at the same time
                    Task {
                        //can but does not need to be in one line
                        async let fetchImage1 = fetchImage() //<-----
                        let (image1, image2) = await (try fetchImage(), try fetchImage1) //<-----
                        self.images2.append(contentsOf: [image1, image2])
                    }
                }
        }
    }
    
    func fetchImage() async throws -> UIImage {
        do {
            try await Task.sleep(for: .seconds(1))
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://picsum.photos/300")!)
            guard let image = UIImage(data: data) else {
                throw URLError(.badURL)
            }
            return image
        } catch let error{
            throw error
        }
    }
}

#Preview {
    AsyncLet70()
}
