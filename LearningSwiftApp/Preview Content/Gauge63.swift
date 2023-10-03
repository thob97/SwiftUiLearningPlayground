//
//  Gauge63.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 30.09.23.
//

import SwiftUI

//takeaways:
//1. bietet einige verschiedene diagram styles für das darstellen von data (small ones are fixed sized) (styles also affect the styles of labels)
//2. can have labels above, below, and next to them
//3. can have range
//4. color can be changed
//5. (advanced: custom gaugestyles can be created)

struct Gauge63: View {
    var body: some View {
        VStack {
            //labels
            Gauge(value: 50, in: 0...100) {
                Text("above")
            } currentValueLabel: {
                Text("below")
            } minimumValueLabel: {
                Text("left")
            } maximumValueLabel: {
                Text("right")
            } markedValueLabels: {
                Text("not shown on iphone?")
            }.gaugeStyle(.accessoryLinearCapacity)

            Text("with Empty Labels").padding(.top, 50).font(.headline.bold()).padding(.bottom)
            //style (without labels)
            Gauge(value: 50, in:0...100 , label: {Text("")})
                .gaugeStyle(.accessoryCircular)
                .tint(.red)
            
            Gauge(value: 50, in:0...100 , label: {Text("100")})
                .gaugeStyle(.accessoryCircularCapacity)
                .tint(.orange)
            
            Gauge(value: 50, in:0...100 , label: {Text("")})
                .gaugeStyle(.accessoryLinear)
                .tint(.green)
                .padding()
            
            Gauge(value: 50, in:0...100 , label: {Text("")})
                .gaugeStyle(.linearCapacity)
                .tint(.indigo)
                .padding()
        }
    }
}

struct Gauge63_Previews: PreviewProvider {
    static var previews: some View {
        Gauge63()
    }
}
