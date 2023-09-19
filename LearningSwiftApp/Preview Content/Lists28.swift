//
//  Lists28.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.09.23.
//

import SwiftUI

//Takeaways
//(0. like a specialised vStack (always scrollable))
//1. dynamic & animated list -> useful for modifying (move, delete, add items) or for the good default formatting
//2. has good predefined formatting & some others to choose from (sidebar, plain, grouped, ...)
//3. works great with predefined EditButton() -> (shows delete & move icons)
//4. lists allows section items to use onDelete, onMove (should be used when its dynamic)
//5. section can be used inside lists: provides headers + optional hide button(on .sidebar style)
//6. list & section content/items can be any view -> highly customisable
//7. list can be styled (some can be placed inside list, some only outside)
//8. list has default style types: 1(automatic, insetGrouped, sidebar(with hide)button)), 2(inset/plain), 3(grouped)
//9. don't use multiple lists (e.g by stack(list, list)) -> as each list is its own scrollable -> done in this just for demonstration purpose

struct Lists28: View {
    @State var fruits: [String] = ["Apple","Orange"]
    var veggies: [String] = ["Tomato","Potato","Carrot"]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                //style: automatic, insetGrouped, sidebar
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
                
                //style: inset/plain
                List {
                    //without section
                    VStack{
                        Image(systemName: "flame")
                        Text("the above list is: in sidebar style")
                    }
                    Text("inset/plain")
                }
                .frame(height: 150)
                .listStyle(.inset)
                
                //style: grouped
                List {
                    //without section
                    VStack{
                        Image(systemName: "flame")
                        Text("Flame")
                    }
                    Text("grouped")
                }
                .frame(height: 150)
                .listStyle(.grouped)
                
                
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
