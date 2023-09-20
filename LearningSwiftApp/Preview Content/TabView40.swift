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
//2. for bottomAppBar: items need .tagItem modifier (accepts text+image)
//3. accepts an optional binding with the use of .tag -> allows the tabs to be changed by anything that changes the binding, instead of just when pressing the tab (binding can have any datatype: int, enum, ...)
//4. background only visible when scrolling -> but can be customised -> Group().toolBarBackground(vis)
//5. is cheap lazy -> inits all at once, but only displays items which are on view (.onAppear)

enum PageTab{
    case Home, PageView, Settings
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
    init() {print("was init")}
    var body: some View{
        TabView {
            Rectangle()
                .foregroundColor(.orange)
                .onAppear{
                    print("orange Appeared")
                }
                .onDisappear{
                    print("orange Disappeared")
                }
            
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
