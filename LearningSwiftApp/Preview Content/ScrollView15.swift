//
//  ScrollView15.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 12.08.23.
//

import SwiftUI


///takeaways: ScrollView on top of Stack
/// use Lazy Stacks to load only if in view
struct ScrollView15: View {
    var body: some View {
        ScrollView() {
            LazyVStack(spacing:0) {
                ForEach(0..<5) { y in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing:0){
                            ForEach(0..<5) {x in
                                item(x, y)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func item(_ x:Int, _ y: Int) -> some View {
        return RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(width: 200, height: 150)
            .shadow(radius: 10, x: 5, y: 10)
            .padding(20)
            .overlay {
                Text("\(y) \(x)")
            }
    }
    
}

struct ScrollView15_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView15().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
