//
//  Slider39.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 18.09.23.
//

import SwiftUI

//takeaways
//1. customise-able: range, step, onEdit, minTextLabel, maxTextLabel, label
//(2. you can use string format to format the binding double for a more fitting string)

//1 starting value + range
struct Slider39: View {
    @State var initialValue: Double = 10
    
    var body: some View {
        VStack(){
            Text("\(initialValue)")
            Slider(value: $initialValue, in: 0...100)
                .tint(.red)
            
            EmptyView().frame(height: 50)
            
            Text(String(format: "%.0f", initialValue))
            Slider(value: $initialValue, in: 1...5, step: 1) {
                Text("will not show? prob. on other platforms")
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("5")
            } onEditingChanged: { (_) in
                //do some computation
            }
        }.padding()
    }
}

struct Slider39_Previews: PreviewProvider {
    static var previews: some View {
        Slider39()
    }
}
