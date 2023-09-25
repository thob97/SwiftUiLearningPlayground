//
//  Grid16.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

//takeaway:
//1. useful if you want multiple rows of items
//2. columns can be fixed size, flexible(as big as possible), adaptive(as many as possible)
//3. can have pinned sections
//4. default spacing (row + column) is platform dependent

struct Grid16: View {
    

    
    var body: some View {
        ScrollView(){
            VStack {
                //(useless) header
                Rectangle()
                    .fill(.yellow)
                    .frame(height: 400)
                
                
                LazyVGrid( //<---------
                    //annotate columns: fixed size, flexible(as big as possible), adaptive(as many as possible)
                    columns: [ //<---------
                        GridItem(.flexible()),
                        GridItem(.fixed(50)),
                        GridItem(.adaptive(minimum: 50), spacing: nil) //spacing between columns
                    ],
                    alignment: .center, //<---------
                    spacing: nil, //spacing between rows //<---------
                    pinnedViews: [.sectionHeaders]) { //<---------
                    
                    //MARK: optional: special section for pinnedView
                    Section( //<---------
                        header:
                            Text("Section 1")
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.red)
                            .padding(.leading)
                    ){
                        ///actual flexible items
                        ForEach(0..<50) { i in
                            Rectangle()
                                .fill(.orange)
                                .aspectRatio(2/3, contentMode: .fit)
                                .overlay{
                                    Text("\(i)")
                                }
//                            Text("\(i)")
//                                .font(.system(size: 200))
//                                .minimumScaleFactor(0.001) //if font is to big, scale it down
//                                .aspectRatio(contentMode: .fit)
//                                .background(.orange)
                        }
                    }
                }
            }
        }
    }
}

struct Grid16_Previews: PreviewProvider {
    static var previews: some View {
        Grid16().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
    }
}
