//
//  Text01.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 10.08.23.
//

import SwiftUI

//takeaways:
//1. text is highly customisable
//2. all text is by default non selectable, use .textSelection to enable it (long-press for copy/share buttons)
//3. scale text to maxFit (code snippet)

struct Text01: View {
    var body: some View {
        VStack {
            Text("Hello, World! this is more of a test\n than anything else")
                .font(.title.bold().width(.compressed).weight(.light))
                //.bold()
                //.fontWidth(.compressed)
                //.fontWeight(.light)
            
                .underline(true, pattern: Text.LineStyle.Pattern.dot, color: Color.red)
                .baselineOffset(50)
                //.frame(width: 400, height: 400, alignment: .bottom)
                .textSelection(.enabled)
            
            Text("🦊")
            //scale text to maxFit
            .font(.system(size: 200))
            .minimumScaleFactor(0.01) //if font is to big, scale it down
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct Text01_Previews: PreviewProvider {
    static var previews: some View {
        Text01()
    }
}
