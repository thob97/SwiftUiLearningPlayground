//
//  Lists28.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.09.23.
//

import SwiftUI

//style (hole predefined list) appbuttons, headers, onelist
//Takeaways
//0. like a specialised vStack (always scrollable)
//1. use full for modifying (move, delete, add items)
//2. has good predefined formatting
//3. lists allow sections, items of lists allow onDelete, onMove


struct Lists28: View {
    @State var fruits: [String] = ["Apple","Orange","Banana","Peach"]
    var veggies: [String] = ["Tomato","Potato","Carrot"]
    
    var body: some View {
        
        NavigationStack {
            List{
                //Section 1: add, del, move
                Section(header: Text("Fruits")){
                    ForEach(fruits,id: \.self) { val in
                        Text(val)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                
                //Section 2: Styling
                Section {
                    ForEach(veggies,id: \.self) { val in
                        Text(val)
                    }
                } header: {
                    HStack{
                        Text("Styling Section")
                        Image(systemName: "flame.fill")
                    }
                    .foregroundColor(.green)
                    .font(.headline)
                }
                //Styling: (some be in- or outside of list)
                .accentColor(.red)
                .foregroundColor(.white)
                .listRowBackground(Color.blue)
                //.listRowSeparator(.hidden)
                //.listSectionSeparator(.hidden) //only visible on some styles -> .inset
                
            }
            //Styling: (needs to be outside of list)
            .listStyle(.sidebar) //adds hide next to section
            
            
            //Navbar
            .navigationTitle(Text("Grocery List"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){EditButton()}
                ToolbarItem(placement: .navigationBarTrailing){Button("Add", action: add)}
            }
        }
    }
    
    func add(){
        fruits.append("Kiwi")
    }
    
    func delete(indexSet: IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    func move(indexSet: IndexSet, index: Int){
        fruits.move(fromOffsets: indexSet, toOffset: index)
    }
}

struct Lists28_Previews: PreviewProvider {
    static var previews: some View {
        Lists28()
    }
}
