//
//  ColorPicker36.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 18.09.23.
//

import SwiftUI

//takeaways:
//1. predefined for picking any color in app
//2. color picker will only open once the "tiny" button is pressed
//3. use on any action: advanced: hacky -> should not be used, as it reverse-engineer run-time -> define func & extension to open the color picker on any action
//(4. can have custom label)

struct ColorPicker36: View {
    @State var backgroundC: Color = .black
    
    var body: some View {
        ZStack{
            backgroundC.ignoresSafeArea()
            
            ColorPicker("Pick any Color", selection: $backgroundC, supportsOpacity: true)
                //style
                .font(.headline)
                .padding()
                .background(.white)
                .cornerRadius(20)
                .padding(50)
                .shadow(color: .white.opacity(0.4), radius: 10, x: 10, y: 10)
                //for custom
                .onTapGesture {
                    UIColorWellHelper.helper.execute?()
                }
            
        }
    }
}

struct ColorPicker36_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker36()
    }
}




//https://stackoverflow.com/questions/73382095/activate-color-picker-overlay-when-button-pressed-swiftui
//use color picker on any action (bad: reverse-engineer run-time)
extension UIColorWell {

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        if let uiButton = self.subviews.first?.subviews.last as? UIButton {
            UIColorWellHelper.helper.execute = {
                uiButton.sendActions(for: .touchUpInside)
            }
        }
    }
}

class UIColorWellHelper: NSObject {
    static let helper = UIColorWellHelper()
    var execute: (() -> ())?
    @objc func handler(_ sender: Any) {
        execute?()
    }
}
