//
//  Toolbar27.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 16.09.23.
//

import SwiftUI

//Takeaways
//1. new version of navBar
//2. to create a navBar, appBar, appBarMenu, keyboardBar
//3. adaptive on all apple devices -> mac, iPad, iOS, watchOS, ...
//4. has many different placements for icons
//5. regions can be hidden by modifier (even if in deeper depth)

struct Toolbar27: View {
    var body: some View {
        NavigationStack{
            //Content / Items
            ScrollView{
                ForEach(0..<10){num in
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                        .cornerRadius(8)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
            }
            
            //Title
            .navigationTitle("App Title")
            .navigationBarTitleDisplayMode(.inline)
            
            //Toolbar
            .toolbar {
                //most important placements
                ToolbarItem(placement: .bottomBar) {
                    Image(systemName: "house.fill")
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "xmark")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "checkmark")
                }
                
                //KeyboardBar (not testable with preview -> use emulator)
                ToolbarItem(placement: .keyboard) {
                    Image(systemName: "checkmark")
                }
            }
            //visibility for specific regions of toolbar (can be hidden)
            .toolbar(.visible, for: .tabBar)
            //background visibility for specific regions of toolbar (background can be hidden)
            .toolbarBackground(.visible, for: .navigationBar)
            
            //menuBar when title inline
            .toolbarTitleMenu {
                Button("Nav1"){}
                Button("Action2"){}
            }
            
            //colorScheme for specific regions of toolbar (can be made darkmode)
            .toolbarColorScheme(.light, for: .navigationBar)
            
        }
    }
}

struct Toolbar27_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar27()
    }
}


