//
//  Models46.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 19.09.23.
//

import SwiftUI

//takeaways:
//1. structs can be used to model things, just like classes! (-> not only for views)
//2. make models conform to "Identifiable" by giving it a id parameter (thus is useable e.g. with ForEach())

struct ExampleModel: Identifiable {
    let id: String = UUID().uuidString //<- "id" for identifiable, type doesent matter, does not need to have default value or UUID(), only needs to be unique
    let displayName: String
    let userName: String
    let follower: Int
    let isVerified: Bool
}

struct Models46: View {
    let data: [ExampleModel] = [
    ExampleModel(displayName: "Nick", userName: "nick123", follower: 100, isVerified: true),
    ExampleModel(displayName: "Emily", userName: "itsemily1995", follower: 55, isVerified: false),
    ExampleModel(displayName: "Samantha", userName: "ninja", follower: 355, isVerified: false),
    ExampleModel(displayName: "Chris", userName: "chrish2009", follower: 88, isVerified: true)
    ]
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(data) { modelItem in
                    HStack(spacing: 20){
                        //Profile Pic
                        Circle()
                            .fill(.blue.opacity(0.3))
                            .frame(width: 40)
                        
                        //Names
                        VStack(alignment:.leading){
                            Text("\(modelItem.displayName)")
                                .font(.headline)
                            Text("@\(modelItem.userName)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        //Verified Symbol
                        if modelItem.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        //Followers
                        VStack{
                            Text("\(modelItem.follower)")
                            Text("followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct Models46_Previews: PreviewProvider {
    static var previews: some View {
        Models46()
    }
}
