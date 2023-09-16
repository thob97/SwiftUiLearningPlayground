//
//  NavigationViewAndStack.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI
//Takeaways:
//1. only need once per app -> don't nest them! -> mostly used at start of app
//2. useful as provides: AppbarTitle, navBar, navigationLink
//3. methods can be used in hole tree
//4. (automatic title works great with scrollViews & navigationLink == push() has great animation)
//5. navigationBarHidden(true) == replacementPush()
struct NavigationView25: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                //for spacing only
                VStack(spacing:20) {
                    
                    //Nav Item
                    NavigationLink("Push replace") {
                        SecondScreen(num: 0)
                        //like push replacement
                        .navigationBarBackButtonHidden()
                    }
                    
                    ForEach(0..<50) { num in
                        NavigationLink("Push Screen \(num)", destination: SecondScreen(num: num))
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            //Title
            .navigationTitle("App Title")
            //Navbar
            .navigationBarItems(
                leading: Image(systemName: "person"),
                trailing: NavigationLink(destination: SecondScreen(num:1), label: {
                    Image(systemName: "plus")
                })
            )
        }
    }
}

struct SecondScreen: View {
    let num: Int
    var body: some View {
        Text("Screen \(num)")
    }
}

struct NavigationView25_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView25()
    }
}
