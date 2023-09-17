//
//  Functions19.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

///takeaways:
// 1. use var to extract a view only if its static
// 2. otherwise extract it in new "struct" view
// 3. use binding if nested view updates it
// (4. functions can be extracted as well)
// (5. conditionals and shorter their versions (Ternary Operators) can be used in views)

//maybe? rule of thumb:
//1. use variables for properties
//2. functions for logic
//3. structs for views(graphical) & models(real world to abstract models)

struct Functions19: View {
    @State var dynColor: Color = .blue
    
    var body: some View {
        ZStack {
            //background
            ///changing binding view
            dynColor
                .ignoresSafeArea()
            
            //content
            VStack {
                
                //static view
                staticText
                
                ///conditionals
                (dynColor != .blue) ? Text("Conditional: was pressed once") : Text("")
                
                //update binding
                HStack {
                    ExtractedButton(num:1, name: "Apples", backColor: .red, topColor: $dynColor)
                    ExtractedButton(num:50, name: "Oranges", backColor: .orange, topColor: $dynColor)
                    ExtractedButton(num:100, name: "Banana", backColor: .yellow, topColor: $dynColor)
                }
            }
        }
    }
    let staticText = Text("Static")
        .font(.largeTitle)
}

///extractedView
struct ExtractedButton: View {
    
    let num: Int
    let name: String
    let backColor: Color
    @Binding var topColor: Color
    
    var body: some View {
        Button {
            updateButton()
        } label: {
            VStack{
                Text("\(num)")
                Text(name)
            }
            .foregroundColor(.black)
            .padding(.all, 20)
            .background(backColor)
            .cornerRadius(20)
        }
    }
    
    ///func
    func updateButton(){
        topColor = backColor
    }
}



struct Functions19_Previews: PreviewProvider {
    static var previews: some View {
        Functions19().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
