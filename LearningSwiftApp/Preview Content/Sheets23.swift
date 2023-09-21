//
//  Sheets23.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.09.23.
//

import SwiftUI

//TAKEAWAYS:
//0. there are sheets and fullscreencovers
//1. only one .sheet per view possible
//2. is lazy
//3. to dismiss needs: @Environment(\.presentationMode) (TODO: this does not work if sheet & Environment.dismiss() is in the same struct -> weird?)
//4. can be made resizeable: large, medium, fraction(), height()
// 4.1 size can be changed by dragging
// 4.2 size can be changed by computational(but needs additional binding)) with .presentationDetents(_, optional binding)
// 4.3 dismiss by dragging can be disabled: interactiveDismissDisabled()
// 4.4 these modifiers can be ON the sheet, or INSIDE the sheet
// 4.5 sheet only allows the sizes specified in .presentationDetents(detents:Set<>)

struct Sheets23: View {
    @State var showSheet: Bool = false
    @State var detents: PresentationDetent = .large // resize
    let depth: Int

    //for lazy testing
    init(depth: Int) {
        self.depth = depth
        print("\(depth) was init")
    }
    
    var body: some View {
        VStack {
            //title
            Text("Current Depth: \(depth)").font(.title)
            
            //dismiss button
            if depth>0 { DismissButton() }

            //resize Buttons
            if depth>0 {
                Button("large"){detents = .large}
                Button("medium"){detents = .medium}
                Button("fraction 30%"){detents = .fraction(0.3)}
                Button("height 100px"){detents = .height(100)}
            }
            
            //push button
            PushButton(showSheet: $showSheet, depth: depth)
            
            //Sheet (needs binding)
            //or fullScreenCover
            .sheet(isPresented: $showSheet) {
                Sheets23(depth: depth+1)
            }
            .presentationDetents([.large, .medium, .fraction(0.3), .height(100)], selection: $detents)
            .interactiveDismissDisabled()   
        }
    }
}

struct DismissButton: View {
    //to call dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .foregroundColor(.white)
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding()
                .background(.red)
                .cornerRadius(50)
        }
    }
}

struct PushButton: View {
    @Binding var showSheet: Bool
    let depth: Int
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("Push")
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: 100, height: 50)
                .background(Color.blue.cornerRadius(10))
        }
    }
}


struct Sheets23_Previews: PreviewProvider {
    static var previews: some View {
        Sheets23(depth: 0)
    }
}
