//
//  Picker35.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

//takeaways
//1. there are 3 useful styles: segmented, menu, wheel
//2. TODO: custom labels(custom initial displayed text) are unusable for all 3 versions
//3. styling of content is restricted -> can only be archived when using UIKit
//4. content can at most display text & image, segmented can only display text
//5. data can be [string], [Int], [enum] ... pick the most fitting -> tag & state var needs to be same type -> so that the state var can "catch the tag" (on change: state var = tag)
//6. Picker().pickerStyle(menu) can also be created with standalone view: Menu()

import SwiftUI

struct Picker35: View {
    @State var pickedSegmented: String = "Most Popular"
    @State var pickedMenu: String = "Most Liked"
    @State var pickedWheel: Int = 2
    @State var selectedMenu: String?
    let data: [String] = ["Most Recent", "Most Popular", "Most Liked"]
    
    var body: some View {
        VStack(spacing:50){
            
            //text
            VStack(alignment:.leading){
                Text("Segmented: \(pickedSegmented)").font(.title)
                Text("Menu: \(pickedMenu)").font(.title)
                Text("Wheel: \(pickedWheel)").font(.title)
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            
            //segmented (content: can only display text)
            Picker(selection: $pickedSegmented, label: Text("unused")) {
                ForEach(data, id: \.self) { ele in
                    Label(ele, systemImage: "flame").tag(ele)
                        .foregroundColor(.red)
                }
            }
            .pickerStyle(.segmented)
            .background(.red.opacity(0.1))
            .padding(.horizontal, 10)
            
            
            //menu (content: can display label -> text + pic)
            Picker(selection: $pickedMenu, label: Text("unused")) {
                ForEach(data, id: \.self) { ele in
                    Label(ele, systemImage: "flame").tag(ele)
                }
            }
            .padding(10)
            .pickerStyle(.menu)
            .tint(.red)
            .background(.blue.opacity(0.1))
            .cornerRadius(20)
           
            //standalone menu view
            Menu {
                Button("Most Recent"){selectedMenu = "Most Recent"}
                Button("Most Liked"){selectedMenu = "Most Liked"}
                Button("Most Popular"){selectedMenu = "Most Popular"}
            } label: {
                Label(selectedMenu ?? "Initial Value", systemImage: "arrow.up.and.line.horizontal.and.arrow.down")
                    .padding(20)
                    .tint(.red)
                    .background(.blue.opacity(0.1))
                    .cornerRadius(20)
            }
            

            
            
            //wheel picker -> (title is unused) (content: can display label -> text + pic)
            Picker(selection: $pickedWheel, label: Text("unused")) {
                ForEach(0..<10) { num in
                    Label("\(num)", systemImage: "flame").tag(num)
                        .foregroundColor(.red)
                }
            }
            .pickerStyle(.wheel)
            .frame(width: 200)
            .background(.gray.opacity(0.1))
            .cornerRadius(20)
        }
    }
}

struct Picker35_Previews: PreviewProvider {
    static var previews: some View {
        Picker35()
    }
}
