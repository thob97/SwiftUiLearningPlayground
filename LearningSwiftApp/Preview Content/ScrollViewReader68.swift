//
//  ScrollViewReader68.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 01.10.23.
//

import SwiftUI

//takeaways:
//1. can be used WITH a scrollview: provides the ability to scroll OR move instantly OR start at the desired location automatically
//2. proxy parameter provides: scrollTo method
//3. scrollTo method needs to know to where (view needs an id)
//4. for animated scrolling use withAnimation (but animation seems not to be customisable)
//5. anchor on scrollTo can be specified (to scroll to center, top, bottom, ... of desired object)

struct ScrollViewReader68: View {
    @State var scrollToIndex: Int = 0
    @State var textField: String = ""
    
    var body: some View {
        VStack {
            //Textfield
            TextField("Scroll to...", text: $textField)
                .keyboardType(.numberPad)
                .padding()
                //border
                .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle()).fill(.gray.opacity(0.5)))
                .padding()
                //change the index if textField types valid int
                .onSubmit {
                    if let index = Int(textField){
                        scrollToIndex = index
                    }
                }
            
            ScrollView {
                ScrollViewReader { proxy in //<----- creation
                    ForEach(0..<100) { index in
                        Text("\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity, minHeight: 200)
                            .background(.white)
                            .cornerRadius(8)
                            .padding()
                            .shadow(radius: 8)
                            .tag(index)
                            .id(index) //<----- id
                    }
                    //use onChange to listen to changes on the index
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation() { //<----- animation
                            proxy.scrollTo(newValue, anchor: .center) //<----- proxy & scroll to
                        }
                    }
                }
            }
            
        }
    }
}

struct ScrollViewReader68_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReader68()
    }
}
