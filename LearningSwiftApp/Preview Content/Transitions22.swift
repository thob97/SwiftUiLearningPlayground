//
//  Transitions22.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI

//TAKEAWAY:
//1. transitions: animate objects which are not visible/ on the screen (but needs conditions)
//2. transitions do somehow not work with animation modifier
//3. .animation modifier must be placed outside the conditional, multiple .animation modifiers are possible

struct Transitions22: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Transition") {
                    
                        isAnimated.toggle()
                    
                }
                TransitionItem(isAnimated: $isAnimated, transition: .opacity, title: "Opacity")
                TransitionItem(isAnimated: $isAnimated, transition: .scale(scale: 0), title: "Scale")
                TransitionItem(isAnimated: $isAnimated, transition: .slide, title: "Slide")
                TransitionItem(isAnimated: $isAnimated, transition: .move(edge: .leading), title: "Move")
                TransitionItem(isAnimated: $isAnimated, transition: .offset(x: 20, y: -10), title: "Offset")
                TransitionItem(isAnimated: $isAnimated, transition: .push(from: .leading), title: "Push")
                TransitionItem(isAnimated: $isAnimated, transition: .asymmetric(insertion: .opacity, removal: .scale), title: "Asymmetric")
                TransitionItem(isAnimated: $isAnimated, transition: .opacity.combined(with: .slide), title: "Combined")
                
                
                Spacer()
            }
            TransitionedShoppingCart(isAnimated: $isAnimated)
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct Transitions22_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Transitions22()
        }
    }
}

struct TransitionedShoppingCart: View {
    @Binding var isAnimated: Bool
    
    var body: some View {
        VStack {
            if isAnimated {
                Rectangle()
                .frame(height: UIScreen.main.bounds.height/4)
                .foregroundColor(.blue)
                .transition(.move(edge: .bottom))
            }
        }//.animation(.spring(), value: isAnimated)
    }
}

struct TransitionItem: View {
    @Binding var isAnimated: Bool
    let transition: AnyTransition
    let title: String
    
    var body: some View {
        VStack {
            if isAnimated {
                RoundedRectangle(cornerRadius: 8)
                .frame(width: 250, height: 50)
                .transition(transition)
                .overlay {
                    Text(title)
                        .foregroundColor(.white)
                }
            }//.animation(.spring(), value: isAnimated)
        }
    }
}
