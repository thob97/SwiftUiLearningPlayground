//
//  AppStorage49.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 20.09.23.
//

import SwiftUI

//takeaways:
//1. mini-database which is stored local / is persistent, even after reboots (for small data only) (stores item in global sets)
//2. two ways to save/get
// 2.1 save: UserDefaults.standard.set(val, key) + get: UserDefaults.standard.valueType(key) (uiKit: useles version)
// 2.2 autoSave & get: @AppStorage(key) var ... (always use this new version)

struct AppStorage49: View {
    @AppStorage("some_Key") var storedValue: Int?
    
    var body: some View {
        VStack(spacing:20) {
            if let storedValue {
                Text("\(storedValue)")
            }
            Button("Save new Random") {
                storedValue = Int.random(in: 0...100)
            }
        }
    }
}

struct AppStorage49_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage49()
    }
}
