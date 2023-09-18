//
//  Stepper38.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 18.09.23.
//

import SwiftUI

//takeaways:
//1. used if you want to increment and decrement something (+ / -)
//2. customise: step, range, onEdit(), onIncrement(), onDecrement(), label
//3. to use onIncrement()/ OnDecrement() with range -> use onEdit to simulate onIncrement()/OnDecrement
//^ https://stackoverflow.com/questions/65781501/how-to-use-increment-decrement-functions-in-stepper-while-also-using-onchange

struct Stepper38: View {
    @State var strideAble: Int = 0
    
    @State var xRect: Double = 0
    @State var yRect: Double = 0
    
    var body: some View {
        VStack{
            Stepper("Step:2, \nRange:0...10, \nStride-able val: \(strideAble)", value: $strideAble, in: 0...10, step: 2)
            
            Spacer()
            
            Rectangle()
                .foregroundColor(.cyan)
                .frame(width: 100 + xRect, height: 100 + yRect)
                .cornerRadius(20)
            
            Spacer()
            
            Stepper("Change xRect Size") {
                withAnimation {
                    xRect += 10
                }
            } onDecrement: {
                withAnimation {
                    xRect -= 10
                }
            }
            
            Stepper("Change yRect Size") {
                withAnimation {
                    yRect += 10
                }
            } onDecrement: {
                withAnimation {
                    yRect -= 10
                }
            }
        }.padding()
    }
}

struct Stepper38_Previews: PreviewProvider {
    static var previews: some View {
        Stepper38()
    }
}
