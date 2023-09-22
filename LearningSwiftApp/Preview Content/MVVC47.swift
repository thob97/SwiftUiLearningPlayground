//
//  ObservableObject47.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 19.09.23.
//

import SwiftUI

//takeaways:
//0. important syntax: @ObservableObject, @StateObject, ObservableObject, @Published
//1. lets you observe an object & update view on changes
//2. useful for separating logic(data) from view(visuals)
//3. @state only in struct+view useable
//4. @published is like @state for classes (will alert the class that something changed, when the @published var changes)
//5. @observedObject is like @state but for objects (updates the view when the object updates) (object needs to inherit from "observableObject")
//6. @stateObject is like @observedObject but persistent (when VIEW (onAppear) reloads object wont reload as well, but keep its previous state) (useful when going from one page deeper to another, on a back button press -> object does not need to reload) (this does however not hold true for the reversed situation: Page1 -> Page2(State), Page1 <- Page2(State), Page1 -> Page2(creates new object, not persistent) ) (Only the init needs to be state, child's will "inherit" persistence: State -> Observe -> _ === State -> persistent <- _)
// 6.1 @StateObject -> use on creation / init
/// 6.1.1 (Use the @StateObject attribute to initialise a model object for a given property only once during the life time of the app)
// 6.2 @ObservedObject -> use on subviews

class ViewModelFruit: ObservableObject {
    @Published var fruits: [Fruit2] = []
    @Published var isLoading: Bool = true
    
    init() {
        fetchData()
    }
    
    func fetchData(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.fruits.append(contentsOf:[
                Fruit2(name: "Apple", count: 5),
                Fruit2(name: "Orange", count: 8),
                Fruit2(name: "Banana", count: 1)
            ])
            self.isLoading = false
        }
    }
    
    func removeFruit(index: IndexSet){
        fruits.remove(atOffsets: index)
    }
    
}

struct Fruit2: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

struct MVVC47: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("Go to ObservedObjectPage", value: "ObservedObjectPage")
                NavigationLink("Go to StateObjectPage", value: "StateObjectPage")
            }.navigationDestination(for: String.self) { string in
                switch string {
                case "ObservedObjectPage":
                    ObservedObjectPage(nil)
                case "StateObjectPage":
                    StateObjectPage()
                default:
                    Text("Should never end up here")
                }
            }
            .navigationTitle("Observed- & State- Pages")
        }
    }
}

//1:1 like stateObjectPage - only difference the viewModel @
struct ObservedObjectPage: View {
    //only difference
    @ObservedObject var viewModel: ViewModelFruit
    
    //so that this can be the next Page for StatePage for testing State->Observe->_
    init(_ viewModel: ViewModelFruit?) {
        self.viewModel = viewModel ?? ViewModelFruit()
    }
    
    //1:1 like stateObjectPage
    var body: some View{
        List {
            if viewModel.isLoading {
                ProgressView()
            }
            else {
                ForEach(viewModel.fruits) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                        Text(fruit.name)
                    }
                }
                .onDelete(perform: viewModel.removeFruit)
                
                NavigationLink("Test Return of Next Page") {
                    Text("Next Page")
                }
            }
        }
        //.onAppear(perform: viewModel.fetchData)
    }
}

//1:1 like observedObjectPage - only difference the viewModel @
struct StateObjectPage: View {
    //only difference
    @StateObject var viewModel: ViewModelFruit = ViewModelFruit()
    
    //1:1 like observedObjectPage
    var body: some View{
        List {
            if viewModel.isLoading {
                ProgressView()
            }
            else {
                ForEach(viewModel.fruits) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                        Text(fruit.name)
                    }
                }
                .onDelete(perform: viewModel.removeFruit)
                
                NavigationLink("Test Return of Next Page") {
                    ObservedObjectPage(viewModel)
                }
            }
        }
        //.onAppear(perform: viewModel.fetchData)
    }
}

struct MVVC47_Previews: PreviewProvider {
    static var previews: some View {
        MVVC47()
    }
}
