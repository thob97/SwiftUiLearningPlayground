//
//  Animations20.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 11.09.23.
//

import SwiftUI

//TAKEAWAY:
//1. will animate all changes that are related to the @state property
// 1.1 either related by condition (state isAnimated: bool)
// 1.2 (others might also possible but less practical) (eg. related by value (state size: Int)) (but then again this could also be archived by a bool property)
//2. there are two ways to use animation
// 2.1 withAnimation() in Button (preferred)
// 2.2 .animation modifier on item, animations are customisable per view -> more fine-grained configuration
//3. animations: animate objects which are already visible/ on the screen (modifiers)

struct Animations20: View {
    @State var isAnimated: Bool = false
    @State var angle: Double = 0
    @State var x: Double = 0
    @State var y: Double = 0
    @State var z: Double = 0
    
    @State var isAnimated2: Bool = false
    @State var angle2: Double = 0
    @State var x2: Double = 0
    @State var y2: Double = 0
    @State var z2: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            AnimatedItemWay1(isAnimated: $isAnimated, angle: $angle, x: $x, y: $y, z: $z)
                .onTapGesture {
                    //version1 with withAnimation()
                    withAnimation(.default.delay(0.5).repeatCount(3)){
                        isAnimated.toggle()
                        angle = Double(Int.random(in: 0...360))
                        x = Double(Int.random(in: -100...100))
                        y = Double(Int.random(in: -100...100))
                        z = Double(Int.random(in: -100...100))
                    }
                }
            
            Spacer()
            AnimatedItemWay2(isAnimated: $isAnimated2, angle: $angle2, x: $x2, y: $y2, z: $z2)
                .onTapGesture {
                    //version2 does not need button to use withAnimation()
                    isAnimated2.toggle()
                    angle2 = Double(Int.random(in: 0...360))
                    x2 = Double(Int.random(in: -100...100))
                    y2 = Double(Int.random(in: -100...100))
                    z2 = Double(Int.random(in: -100...100))
                }
            Spacer()
        }
    }
}

struct AnimatedItemWay1: View {
    @Binding var isAnimated: Bool
    @Binding var angle: Double
    @Binding var x: Double
    @Binding var y: Double
    @Binding var z: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: isAnimated ? 10 : 30)
            .foregroundColor(isAnimated ? .green : .red)
            .frame(width:isAnimated ? 150 : 150,height: isAnimated ? 150 : 150)
            .offset( x: isAnimated ? 0 : x, y: isAnimated ? 0 : y)
            .rotation3DEffect(Angle(degrees: angle), axis: (x: x, y: y, z: z))
    }
}

struct AnimatedItemWay2: View {
    @Binding var isAnimated: Bool
    @Binding var angle: Double
    @Binding var x: Double
    @Binding var y: Double
    @Binding var z: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: isAnimated ? 10 : 30)
            .foregroundColor(isAnimated ? .green : .red)
            .frame(width:isAnimated ? 150 : 150,height: isAnimated ? 150 : 150)
            .offset( x: isAnimated ? 0 : x, y: isAnimated ? 0 : y)
            .rotation3DEffect(Angle(degrees: angle), axis: (x: x, y: y, z: z))
            //instead of withAnimation() in Button // value: observable
            .animation(.default.speed(0.2).repeatForever(), value: isAnimated)
            
    }
}



struct Animations20_Previews: PreviewProvider {
    static var previews: some View {
        Animations20()
    }
}



