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
//4. .onTap modification has similar functionality (but button is better imo)
//5. there are some predefined buttons: role property (destructive, cancel), toggle, slider, stepper, edit, push, dismiss, rename, buttonStyle(plain, borderless, bordered, borderedProminent), buttonBorderShape(.capsule), controlSize(size)
//6. buttonStyle work with accent color & light/dark mode (however most of the time buttons will still be custom made)

struct Buttons18: View {
    

    
    var body: some View {
        ScrollView {
            VStack (spacing:20) {
                
                CustomButtons()

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
                InSomeWayButtons()
                ButtonStyles()
            }
        }
    }
}

struct CustomButtons: View {
    @State var count: Int = 0
    @State var pressed: String = "None"
    
    
    var body: some View{
        VStack {
            //Title
            VStack{
                Text("Last pressed Button: \(pressed)")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Total times a button was presed: \(count)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
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

struct InSomeWayButtons: View {
    @State var toggleBinding: Bool = true
    @State var stepperBinding: Int = 0
    @State var sliderBinding: Double = 65
    
    var body: some View{
        VStack {
            HStack(spacing:20){
                Toggle("", isOn: $toggleBinding)
                    .labelsHidden()
                Toggle("Toggle Button", isOn: $toggleBinding)
                    .toggleStyle(.button)
            }
            Stepper("", value: $stepperBinding)
                .labelsHidden()
            
            Slider(value: $sliderBinding, in: 0...100)
                .padding(.horizontal, 50)
        }
    }
}


//work with accent color & dark/light mode
struct ButtonStyles: View {
    var body: some View{
        VStack {
            HStack {
                Button("plain") {}
                    .buttonStyle(.plain)
                Button("plain") {}
                    .buttonStyle(.plain)
                    .buttonBorderShape(.capsule)
                Button("plain") {}
                    .buttonStyle(.plain)
                    .controlSize(.large)
                Button("plain") {}
                    .buttonStyle(.plain)
                    .controlSize(.mini)
            }
            
            HStack {
                Button("bordered") {}
                    .buttonStyle(.bordered)
                Button("bordered") {}
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                Button("bordered") {}
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                Button("bordered") {}
                    .buttonStyle(.bordered)
                    .controlSize(.mini)
            }
            
            HStack {
                Button("borderless") {}
                    .buttonStyle(.borderless)
                Button("borderless") {}
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.capsule)
                Button("borderless") {}
                    .buttonStyle(.borderless)
                    .controlSize(.large)
                Button("borderless") {}
                    .buttonStyle(.borderless)
                    .controlSize(.mini)
            }
            
            HStack {
                Button("borderedP") {}
                    .buttonStyle(.borderedProminent)
                Button("borderedP") {}
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                Button("borderedP") {}
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                Button("borderedP") {}
                    .buttonStyle(.borderedProminent)
                    .controlSize(.mini)
            }
            

        }
    }
}


struct Buttons18_Previews: PreviewProvider {
    static var previews: some View {
        Buttons18().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
