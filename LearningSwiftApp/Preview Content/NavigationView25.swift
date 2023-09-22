//
//  NavigationViewAndStack.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI

//Takeaways:
//1. NavigationView only needed once per app -> don't nest them! -> mostly used at start of app
//2. useful as provides: AppbarTitle, navBar, navigationLink (methods can be used in hole tree)
//3. (automatic title works great with scrollViews. And navigationLink(== push()) has great animation)
//4. navigationBarHidden(true)(== replacementPush())
//5. navBar is deprecated for Toolbar(== appBar, navBar, ...)
//6. list + navigation link work good together = get an auto ">" icon
struct NavigationView25: View {
    var body: some View {
        NavigationView {
            List {
                //Nav Item
                NavigationLink("Push replace") {
                    SecondScreen(num: 0)
                        //push replacement
                        .navigationBarBackButtonHidden()
                }
                    
                ForEach(0..<50) { num in
                    //push
                    NavigationLink("Push Screen \(num)"){
                        SecondScreen(num: num)
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
