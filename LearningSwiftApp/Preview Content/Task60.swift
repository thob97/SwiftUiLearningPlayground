//
//  Task60.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 29.09.23.
//

import SwiftUI

//takeaways:
//1. task are used to run async code in view-tree (+ better version than DispatchQueue())
//2. multiple task can be run !simultaneously!
//3. task can have priorities (tells the system which computation to prefer)
//4. task.sleep() can be used (prob. mostly for testing)
//5. task.yield() can be used to let other tasks to execute first
//6. Child tasks: Nested tasks + Task.detached should not be used
//7. cancelation of tasks: (mostly used when moving out of the view to save resources)
// 7.1 either with .onAppear{} .onDisappear() + referenceToTask.cancel()
// 7.2 or with .task{} modifier (auto acts like the 7.1 method)
// 7.3 HOWEVER: if doing some long computation, the computation itself should look if its cancelled, otherwise it might continue (e.g loop)


struct Task60: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Next Page", destination: TaskPage())
                .navigationTitle("Task")
        }
    }
}

struct TaskPage: View {
    @State private var task: Task<(), Never>? //<-----
    
    var body: some View {
        Text("is Fetching")
        .font(.headline.bold())
        //method1 //<-----
        .onAppear{
            task = Task {
                try? await fetchData()
            }
        }
        .onDisappear{
            Task {
                task?.cancel()
            }
        }
        //method2 //<-----
        .task {
            try? await fetchData()
        }
    }
    
    private func fetchData() async throws {
        do { //<----- check for method 1/2 cancelation
            try await Task.sleep(for: .seconds(5))
            try Task.checkCancellation() //<----- check for cancelation in some long computation
            print("fetched successfully")
        } catch {
            print("was cancelled")
        }
     
    }
}

struct Task60_Previews: PreviewProvider {
    static var previews: some View {
        Task60()
    }
}
