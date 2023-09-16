//
//  Grid16.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.08.23.
//

import SwiftUI

struct Grid16: View {
    
    //TODO: annotate's how many columns
    let content: [GridItem] = [
        //either single flexible, single fixed, or multiple flexible
        //spacing => column horizontal padding
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center),
    ]
    
    var body: some View {
        ScrollView(){
            //(useless) header
            VStack {
                Rectangle()
                    .fill(.yellow)
                    .frame(height: 400)
                
                //TODO: annotate's the rows
                //spacing => row vertical padding
                LazyVGrid(columns: content, alignment: .center, spacing: nil, pinnedViews: [.sectionHeaders]) {
                    
                    //TODO: optional: special section for pinnedView
                    Section(
                        header:
                            Text("Section 1")
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.red)
                            .padding(.leading)
                    ){
                        ///actual items
                        ForEach(0..<50) { i in
                            Text("\(i)")
                                .frame(width: 100, height: 150)
                                .background(.blue)
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
