//
//  TabView40.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 18.09.23.
//

import SwiftUI

//takeaways:
//(0. bottomAppBar & pageTabView)
//1. can be used as PageTabView! by changing .tabViewStyle(.page)
//2. accepts an optional binding with the use of .tag -> allows the tabs to be changed by anything that changes the binding, instead of just when pressing the tab (binding can have any datatype: int, enum, ...)
//3. background only visible when scrolling -> but can be customised -> Group().toolBarBackground(vis)
//4. is not lazy -> renders all at once

enum PageTab{
    case Home
    case PageView
    case Settings
}

struct TabView40: View {
    
    @State var currentTab: PageTab = PageTab.Home
    
    var body: some View {
        TabView(selection: $currentTab) {
            Group {
                HomePage(currentTab: $currentTab)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(PageTab.Home)
                    
                PageViewPage()
                    .tabItem {
                        Label("PageView", systemImage: "book")
                    }
                    .tag(PageTab.PageView)
                
                SettingsPage()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(PageTab.Settings)
            }
            .toolbarBackground(.visible, for: .tabBar) //make always visible
            .toolbarBackground(Color.gray.opacity(0.3), for: .tabBar) //change color
        }
    }
}

struct HomePage: View {
    @Binding var currentTab: PageTab
    
    var body: some View{
        ZStack{
            Color.cyan.opacity(0.3).ignoresSafeArea()
            VStack{
                Text("Home").font(.title)
                
                //Nav Button
                Button {
                    currentTab = PageTab.PageView
                } label: {
                    Text("Go to Page: PageView")
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .padding()
                        .shadow(radius: 5, x: 5, y: 5)
                }
            }
        }
    }
}

struct SettingsPage: View {
    var body: some View{
        ZStack{
            Color.gray.opacity(0.3).ignoresSafeArea()
            Text("Settings").font(.title)
        }
    }
}

struct PageViewPage: View {
    var body: some View{
        TabView {
            Rectangle()
                .foregroundColor(.orange)
            
            Rectangle()
                .foregroundColor(.pink)
            
            Rectangle()
                .foregroundColor(.yellow)

        }
            //change style to pageView
            .tabViewStyle(.page) // <---
            .indexViewStyle(.page(backgroundDisplayMode: .always)) //custom index background
    }
}

struct TabView40_Previews: PreviewProvider {
    static var previews: some View {
        TabView40()
    }
}

//takeaways:
//1.
//2.
//3.
//4.
//5.
