//
//  ActionSheet30.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

import SwiftUI

//takeaway:
//1. similar to alerts but come from button
//2. now called .confirmationDialog
struct ActionSheet30: View {
    @State var showAction: Bool = false
    @State var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 50) {
                Button("Show Alert") {
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

//new variante
struct ConfirmationDia: View {
    @Binding var showAction: Bool
    
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
