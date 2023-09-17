//
//  AnimationCurves21.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI

//takeaway:
//1. there are many predefined animations curves
//2. custom animations are also possible, but more often than not predefined are sufficient
//3. spring is properly the most useful

struct AnimationCurves21: View {
    @State var animate: Bool = false
    let duration = 2.0
    
    var body: some View {
        VStack {
            Button("Animate") {
                animate.toggle()
            }
            
            //ExtractedView(animate: $animate, animationCurve: .default)
            ExtractedView(animate: $animate, animationCurve: .linear(duration: duration))
            ExtractedView(animate: $animate, animationCurve: .easeOut(duration: duration))
            ExtractedView(animate: $animate, animationCurve: .easeIn(duration: duration))
            ExtractedView(animate: $animate, animationCurve: .easeInOut(duration: duration))
            ExtractedView(animate: $animate, animationCurve: .spring(
                response: duration,
                dampingFraction: 0.5,
                blendDuration: 1.0)
            )
            //customs also possible
        }
    }
}

struct ExtractedView: View {
    @Binding var animate: Bool
    let animationCurve: Animation
    
    var body: some View {
        Rectangle()
            .frame(width: animate ? 300 : 50 , height: 80)
            .cornerRadius(10)
            .foregroundColor(.blue)
            .animation(animationCurve, value: animate)
    }
}

struct AnimationCurves21_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCurves21()
    }
}


