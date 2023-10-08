//
//  Form62.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 30.09.23.
//

import SwiftUI

//takeaways:
//1. just like listview (styled vstack) but without the ability to dynamically(default animated) change the data
//2. -> has predefined styling
//3. -> use it if you want the styling, but do not need to dynamically change data
//4. can have swipe action (just like lists)

struct Form62: View {
    @State var toggle = false
    @State var slider = 15.0
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                Text("Name: John Doe")
                    .swipeActions(edge:.trailing, allowsFullSwipe: false){
                        Button("H") {}.tint(.green)
                }
                Text("Email: john@example.com")
            }
            Section(header: Text("Preferences")) {
                Toggle("Dark Mode", isOn: $toggle)
                Slider(value: $slider, in: 12...24, step: 1.0) {
                    Text("Font Size")
                }
            }
        }
    }
}

struct Form62_Previews: PreviewProvider {
    static var previews: some View {
        Form62()
    }
}
