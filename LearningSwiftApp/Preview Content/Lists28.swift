//
//  Lists28.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.09.23.
//

import SwiftUI

//Takeaways
//(0. like a specialised vStack (always scrollable))
//1. dynamic & animated list -> use full for modifying (move, delete, add items)
//2. has good predefined formatting & some others to choose from (sidebar, plain, grouped, ...)
//3. works great with predefined EditButton()
//4. lists allows section items to use onDelete, onMove (should be used when its dynamic)
//5. sections + normal views can be used inside the list
//6. section provides headers + optional hide button
//7. section content/items can be any view -> highly customisable
//8. list can be styled (some can be placed inside list, some only outside)

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
