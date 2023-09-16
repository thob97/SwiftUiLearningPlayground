//
//  Buttons18.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

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
                
                
                //button1
                Button("Press me!") {
                    count = count + 1
                    pressed = "'Press me!'"
                }
                
                
                //button2
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
                
                
                //button3
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
                
                
                //button4
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
                //role
                Button(role: .cancel) {
                    
                } label: {
                    Text("Cancel role")
                }
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
            ExtractedButton(num: 5, name: "Name", backColor: .blue, topColor: $extractedBinding)
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
