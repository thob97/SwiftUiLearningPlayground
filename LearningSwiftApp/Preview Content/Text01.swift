//
//  Text01.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 10.08.23.
//

import SwiftUI

//takeaways:
//1. text is highly customisable

struct Text01: View {
    var body: some View {
        Text("Hello, World! \nthis is more of a test\n than anything else")
            .font(.title.bold().width(.compressed).weight(.light))
            //.bold()
            //.fontWidth(.compressed)
            //.fontWeight(.light)
        
            .underline(true, pattern: Text.LineStyle.Pattern.dot, color: Color.red)
            .baselineOffset(50)
            .frame(width: 400, height: 400, alignment: .bottom)
    }
}

struct Text01_Previews: PreviewProvider {
    static var previews: some View {
        Text01()
    }
}