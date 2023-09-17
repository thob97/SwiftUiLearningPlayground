//
//  Buttons18.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

//takeaway:
//1. buttons are highly customisable
//2. buttons can have a text label or custom labels (can use label view)
//3. buttons have a role property
//4. there are predefined buttons: role property, edit, push, toggle, dismiss, rename

struct Buttons18: View {
    
    @State var count: Int = 0
    @State var pressed: String = "None"
    
    var body: some View {
        ScrollView {
            VStack (spacing:30) {
                
                
                Text("Last pressed Button: \(pressed)")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Total times a button was presed: \(count)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                
                //custom button1: text
                Button("Press me!") {
                    count = count + 1
                    pressed = "'Press me!'"
                }
                
                
                //custom button2
                Button {
                    count = count + 1
                    pressed = "'SAVE'"
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                
                
                //custom button3
                Button {
                    count = count + 1
                    pressed = "Heart"
                } label: {
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .frame(width: 80, height: 80)
                        .background(.white)
                        .cornerRadius(360)
                        .shadow(radius: 10)
                }
                
                
                //custom button4
                Button {
                    count = count - 1
                    pressed = "Minus"
                } label: {
                    Text("Minus -")
                        .foregroundColor(.gray)
                        .padding()
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .stroke(.gray)
                        )
                }
                
                //custom button5: label
                Button {
                    
                } label: {
                    Label {
                        Text("Label Button")
                    } icon: {
                        Image(systemName: "flame")
                    }.foregroundColor(.green)
                }

                
                
                //role button1
                Button(role: .cancel) {
                    
                } label: {
                    Text("Cancel role")
                }
                
                //role button2
                Button(role: .destructive) {
                    
                } label: {
                    Text("Destructive role")
                }
                
                PredefinedButtons()
                
            }
        }
    }

}

struct PredefinedButtons: View {
    @State var pushBinding: Bool = false
    @State var toggleBinding: Bool = false
    @State var extractedBinding: Color = .red
    var body: some View{
        VStack {
            EditButton()
            PushButton(showSheet: $pushBinding, depth: 5)
            ToggleButton(isNight: $toggleBinding)
            RenameButton()
            DismissButton()
            //PasteButton(payloadType: T##Transferable.Protocol, onPaste: T##([Transferable]) -> Void)
            
        }
    }
}

struct Buttons18_Previews: PreviewProvider {
    static var previews: some View {
        Buttons18().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
