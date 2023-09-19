//
//  Functions19.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

///takeaways:
//1. variables (this 2. for views)
// 1.1 use them for properties
// 1.2 use var to extract a view only if its static/ does not need input properties
//2. functions (this 3. least for views)
// 2.1 for computable logic
// 2.2 use functions to extract a view only if it needs input vars & does not make sense to make as a struct
//3. structs (this 1. for views)
// 3.1 extract view to new struct if:
//  3.1.1 it gets reused
//  3.1.2 it has internal logic (updates something with state vars)
//  3.1.3 its complex or independent enough to extract in its own subview
// 3.2 can also be used to model(real world to abstract models)
//4. use binding if nested view updates it
//(5. conditionals and shorter their versions (Ternary Operators) can be used in views)

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
