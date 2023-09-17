//
//  ActionSheet30.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

import SwiftUI

//takeaway:
//1. similar to alerts but come from bottom
//2. there are two versions
// 2.1 old: .actionSheet(binding){ActionSheet()} will be deprecated soon
// 2.2 new: .confirmationDialog(title, binding, actions, message)
//2. just like alerts -> the old version allows only one per view, to use multiple:
// 2.1 use enum + conditional
// 2.2 OR append on different views (e.g. empty ZStack)
// 2.3 OR use the new Version (confirmationDialog)

struct ActionSheet30: View {
    @State var showAction: Bool = false
    @State var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 50) {
                Button("Show ActionSheet") {
                    showAction.toggle()
                }
                Button("Show Confirmation") {
                    showConfirmation.toggle()
                }
            }
            ConfirmationDia(showAction: $showConfirmation)
            MyActionSheet(showAction: $showAction)
        }
        

    }
}

struct MyActionSheet: View {
    @Binding var showAction: Bool
    
    //return empty ZStack, so that the .modifier is returnable (+ multiple actionSheets are possible)
    var body: some View {
        ZStack{}.actionSheet(isPresented: $showAction) {
            ActionSheet(
                title: Text("ActionSheet Title"),
                message: Text("this is the body message"),
                buttons: [
                    .default(Text("Share")),
                    .default(Text("Save")),
                    .cancel(),
                    .destructive(Text("destructive"))
                ])
        }
    }
}

struct ConfirmationDia: View {
    @Binding var showAction: Bool
    
    //return empty ZStack, so that the .modifier is returnable (+ multiple confirmationsDialogs are possible)
    var body: some View {
        ZStack{}.confirmationDialog(
            "ConfirmationDialog Title",
            isPresented: $showAction,
            titleVisibility: .visible) {
            Button("Share") {}
            Button("Save") {}
        } message: {
            Text("this is the body message")
        }
    }
}

struct ActionSheet30_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet30()
    }
}
