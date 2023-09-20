//
//  EnvironmentObject48.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 20.09.23.
//

import SwiftUI

//takeaways:
//1. like observedObject but as global object -> any file / view / object in the HIERARCHY can reference it
//2. declare by: add on the wanted view the .environmentObject(obj) modifier
//3. get/reference it by: @EnvironmentObject var paraName: type (types HAVE to match!)

struct Fruit3: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class EnvironmentViewModel: ObservableObject{
    @Published var data: [Fruit3] = []
    
    init() {
        fetchData()
    }
    
    func fetchData(){
        data.append(contentsOf: [Fruit3(name: "Apple", count: 3), Fruit3(name: "Orange", count: 5)])
    }
}

struct EnvironmentObject48: View {
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationStack{
            DisplayData(fruits: viewModel.data, title: "God ViewModel through Init")
            NavigationLink(value: 0) {
                Text("Next Page")
            }
            .navigationDestination(for: Int.self, destination: { _ in
                EnvironmentObjectPage()
            })
            .navigationTitle("Global Object")
        }
        .environmentObject(viewModel) //<---------------------
    }
}

//get Object through Environment
struct EnvironmentObjectPage: View {
    @EnvironmentObject var viewModel: EnvironmentViewModel //<---------------------
    
    var body: some View {
        VStack {
            DisplayData(fruits: viewModel.data, title: "Got ViewModel through Environment")
        }
    }
}

//display fruits
struct DisplayData: View {
    let fruits: [Fruit3]
    let title: String
    
    var body: some View{
        List {
            Section(title) {
                ForEach(fruits) { fruit in
                    HStack {
                        Text(fruit.name)
                        Text("\(fruit.count)")
                    }
                }
            }
        }
    }
}

struct EnvironmentObject48_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObject48()
    }
}
