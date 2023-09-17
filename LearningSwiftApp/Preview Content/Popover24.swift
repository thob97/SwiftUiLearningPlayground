//
//  Popover24.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI

//Takeaway
//1. sheets are predefined way to create popovers
//2. animations & transitions can also be used to archive similar results (but transitions seem bugged)
//3. transitions & animations are more dynamic, as sheets is a totally new view, while transitions is just like a overlay
struct Popover24: View {
    @State var showSheet:Bool = false
    @State var showTransitionItem: Bool = false
    @State var showAnimation: Bool = false
    
    var body: some View {
        ZStack{
            //Buttons
            VStack (spacing: 50) {
                HStack(spacing: 20){
                    Button("1: Sheet") {
                        showSheet.toggle()
                    }
                
                    Button("2: Transition") {
                        //withAnimation {
                            showTransitionItem.toggle()
                        //}
                        
                    }
                    
                    Button("3: Animation") {
                        showAnimation.toggle()
                    }
                }
                
                
                Spacer()
            }
                
            //Methods - sheet (best imo)
            .sheet(isPresented: $showSheet) {
                SheetScreen()
            }
            
            //Method - Transition (hacky, as it needs to be on same Zstack -> did not get it working)
            TransitionScreen(show: $showTransitionItem)
            
            
            //Method 3 - Animation (fairly simple, but renders object at all time)
            AnimationScreen(isAnimated: $showAnimation)
                .padding(.top, 50)
                //height offset -> out of view, 55 offset -> for spring() animation
                .offset(y: showAnimation ? 55 : UIScreen.main.bounds.height)
                .animation(.spring(), value: showAnimation)
        }
    }
}

struct SheetScreen: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View{
        ZStack {
            //Background
            Color.green.ignoresSafeArea()
            //DismissButton
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct AnimationScreen: View {
    @Binding var isAnimated: Bool

    var body: some View{
        ZStack {
            //Background
            Color.red.ignoresSafeArea()
            //DismissButton
            Button("Dismiss") {
                    isAnimated = false
            }
        }
    }
}

struct TransitionScreen: View {
    @Binding var show: Bool
    
    var body: some View{
        ZStack(alignment:.bottom){
            if show {
                page()
                    .transition(.move(edge: .bottom))
            }
        }.animation(.interpolatingSpring(stiffness: 25, damping: 6.5), value: show) //custom spring animation
    }
    
    func page() -> some View {
        return ZStack(){
            //Background
            Color.red.ignoresSafeArea()
            //DismissButton
            Button("Dismiss") {
                    show = false
            }
        }
        .padding(.top,50) //so that it does not reach the top
        .offset(y:100) //so that it works with bottom spring animation
    }
}

struct Popover24_Previews: PreviewProvider {
    static var previews: some View {
        Popover24()
    }
}
