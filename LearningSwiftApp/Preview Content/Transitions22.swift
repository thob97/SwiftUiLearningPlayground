//
//  Transitions22.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI

//TAKEAWAY:
//0. useful when it can't be animated using animation, like the transition of two views
//1. transitions: animate objects which are not visible/ on the screen
//2. transitions need conditions with the state var (isVisible) -> (TODO: but button is also animated somehow?)
//3. are animated just like animations. (withAnimation / .animation modifier)
// 3.1 .animation modifier must be placed outside the conditional to work!
//4. transitions can be tricky, (sometimes needs additional ZStacks, sometimes whenAnimated or .animation does not work)

struct Transitions22: View {
    @State var isVisible: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack (alignment:.leading) {
                //button
                Button("Transition") {
                    //withAnimation {
                        isVisible.toggle()
                    //}
                }
                
                //transition items
                TransitionItem(isVisible: $isVisible, transition: .opacity, title: "Opacity")
                TransitionItem(isVisible: $isVisible, transition: .scale(scale: 0), title: "Scale")
                TransitionItem(isVisible: $isVisible, transition: .slide, title: "Slide")
                TransitionItem(isVisible: $isVisible, transition: .move(edge: .leading), title: "Move")
                TransitionItem(isVisible: $isVisible, transition: .offset(x: 20, y: -10), title: "Offset")
                TransitionItem(isVisible: $isVisible, transition: .push(from: .leading), title: "Push")
                TransitionItem(isVisible: $isVisible, transition: .asymmetric(insertion: .opacity, removal: .scale), title: "Asymmetric")
                TransitionItem(isVisible: $isVisible, transition: .opacity.combined(with: .slide), title: "Combined")
                
                Spacer()
            }
            TransitionedShoppingCart(isVisible: $isVisible)
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct TransitionedShoppingCart: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack {
            if isVisible {
                Rectangle()
                .frame(height: UIScreen.main.bounds.height/4)
                .foregroundColor(.blue)
                .transition(.move(edge: .bottom))
            }
        }.animation(.spring(), value: isVisible)
    }
}

struct TransitionItem: View {
    @Binding var isVisible: Bool
    let transition: AnyTransition
    let title: String
    
    var body: some View {
        VStack {
            if isVisible {
                RoundedRectangle(cornerRadius: 8)
                .frame(width: 250, height: 50)
                .transition(transition)
                .overlay {
                    Text(title)
                        .foregroundColor(.white)
                }
            }
        }.animation(.default, value: isVisible)
    }
}


struct Transitions22_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Transitions22()
        }
    }
}
