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
//2. don't add conditional logic to .sheet -> errors -> (but you may add it into the view?)
//3. to dismiss needs: @Environment(\.presentationMode) (this does not work if sheet & Environment.dismiss() is in the same struct)

struct Sheets23: View {
    @State var showSheet: Bool = false
    let depth: Int

    var body: some View {
        VStack {
            //title
            Text("Current Depth: \(depth)").font(.title)
            
            Spacer()
            
            //dismiss button
            if depth>0 { DismissButton() }

            //push button
            PushButton(showSheet: $showSheet, depth: depth)
            
            Spacer()
            
        }

    }
}

struct Sheets23_Previews: PreviewProvider {
    static var previews: some View {
        Sheets23(depth: 0)
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
        
        //Sheet (needs binding)
        //or fullScreenCover
        .sheet(isPresented: $showSheet) {
            //DO NOT add conditional logic
            Sheets23(depth: depth+1)
        }
    }
}
