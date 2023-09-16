//
//  Popover24.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI
//Takeaway
//1. use sheets or animation as transitions seem buggy
//2. transitions are the most dynamic if working, as sheets is a totally new view, while transitions is just like a overlay
struct Popover24: View {
    @State var showSheet:Bool = false
    @State var showMoveT: Bool = false
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
                        withAnimation {
                            showMoveT.toggle()
                        }
                        
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
            if showMoveT {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                        .transition(.move(edge: .bottom))
            }
            
            
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

struct Popover24_Previews: PreviewProvider {
    static var previews: some View {
        Popover24()
    }
}
