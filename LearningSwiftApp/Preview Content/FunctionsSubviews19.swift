//
//  Functions19.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

///takeaways:
/// 1. use var to extract a view only if its stacic
/// 2. otherwise extract it in new "struct" view
/// 3. use binding if nested view updates it
/// (4. funcs can be extracted aswell)
/// (5. conditionals and shorter versions (Ternary Operators) can be used)
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

struct Functions19_Previews: PreviewProvider {
    static var previews: some View {
        Functions19().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
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
