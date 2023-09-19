//
//  NavigationStack26.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.09.23.
//

import SwiftUI

//takeaways:
//1. works only for iOS 16 and up
//2. has real lazy loading! (unlike navigation view, loads the sites to navigate to only once when pressed)
//2.1 for lazy use: navDestinations + navLinks(val), instead of: navLinks(dest)
//3. allows to push multiple screens at once with the use of PATH + append (but in most cases navLinks are sufficient and cleaner)
//4. can replace NavigationView without any changes needed (1:1) (but provides additional functions)
//5. navLinks(val) & type of path can be any (int, string, enum, ...)

enum Pages {
    case PageA1, PageA2, PageA3
    case PageN1, PageN2, PageN3
}

struct NavigationStack26: View {
    @State private var stackedPages: [Pages] = []
    
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
                    Button("Button: Append") {
                        stackedPages.append(Pages.PageA1)
                    }
                    
                    //Append multiple
                    Button("Button: Append multiple", action: {
                        stackedPages.append(contentsOf: [Pages.PageA1, Pages.PageA2, Pages.PageA3])
                    })
                    
                    //with navLink
                    ForEach([Pages.PageN1, Pages.PageN2, Pages.PageN3], id: \.self) { page in
                        NavigationLink("NavigationLink", value: page)
                    }
                    
                    //wont work as path has type Pages -> int not allowed
                    NavigationLink("Wont work", value: 1)
                }
            }
            //important
            .navigationDestination(for: Pages.self) { page in
                switch page {
                case Pages.PageA1:
                    NextPage(title: "Append1")
                case Pages.PageA2:
                    NextPage(title: "Append2")
                case Pages.PageA3:
                    NextPage(title: "Append3")
                case Pages.PageN1:
                    NextPage(title: "Nav1")
                case Pages.PageN2:
                    NextPage(title: "Nav2")
                case Pages.PageN3:
                    NextPage(title: "Nav3")
                }
            }
            //is disabled because PATH is used + has different type
            .navigationDestination(for: Int.self) { num in
                Text("\(num)")
            }
            //Title
                .navigationTitle("MainPage")
        }
    }
}

struct NextPage: View {
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
