//
//  NavigationStack26.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.09.23.
//

import SwiftUI

//takeaways:
//1. works only for iOS 16 and up
//2. has lazy loading! (unlike navigation view, loads the sites to navigate to only once when pressed)
//2.1 for lazy move from navLinks(dest) to navDestinations + navLinks(val)
//3. allows to push multiple screens at once with path, but in most cases navLinks are sufficient and cleaner
struct NavigationStack26: View {
    
    @State private var stackedPages: [String] = []
    
    var body: some View {
        //---PATH---
        //allows to push pages with append instead of navigationLink
        //allows to push multiple pages
        //will disable all navigationDestination with different types than path var has!
        NavigationStack(path: $stackedPages) {
            
            
            ScrollView {
                //for spacing only
                VStack(spacing: 20) {
                    
                    //push with root option / append / without navigationLink
                    ForEach(1..<4) { num in
                        Button("Custom append \(num)") {
                            stackedPages.append("Append \(num) Page")
                        }
                    }
                    
                    //Append multiple
                    Button("Append multiple", action: {
                        stackedPages.append(contentsOf: ["m1","m2","m3"])
                    })
                    
                    //with navLink
                    ForEach(["nav1", "nav2", "nav3"], id: \.self) { val in
                        NavigationLink("Navigation", value: val)

                    }
                    
                    //wont work as path only allows string
                    NavigationLink("Wont work", value: 1)
                }
            }
            //important
            .navigationDestination(for: String.self) { val in
                MyPage(title: val)
            }
            //is disabled because of different root type
            .navigationDestination(for: Int.self) { num in
                Text("\(num)")
            }
            //Title
                .navigationTitle("MainPage")
        }
    }
}

struct MyPage: View {
    let title: String
    
    init(title: String) {
        self.title = title
        print("build, \(title)")
    }
    
    var body: some View {
        Text(title)
    }
}

struct NavigationStack26_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack26()
    }
}
