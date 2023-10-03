//
//  AsyncAwaitThreading59.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 29.09.23.
//

import SwiftUI
//takeaways:
//1. mark functions which is not synchronous (need to wait for data without blocking the hole program) as "async"
//2. mark in these functions the part which shall be waited for with "await" (makes it act like synchronous)
//3. async code will be run in a background thread
//4. Published data (UI) should not be updated with a background thread -> run it with the mainthread with: await MainActor.run(){}
//5. actors are important (... continues in another tutorial)
//6. views need a Task{} to perform async code (also more in another tutorial)
//7. actors, tasks, try, throws, doCatch, async, await are important concepts for async functions

class AsyncAwaitViewModel: ObservableObject{
    @Published var data: [String] = ["Hey"]
    
    func addItem() async { //<----- async
        //some computation: will be in background thread
        let item1 = "Item1: Background Thread"
        
        try? await Task.sleep(for: .seconds(2)) //<----- await
        
        //some computation: will be in background thread
        let item2 = "Item2: Background Thread"
        //-> wait for main thread to update published data
        await MainActor.run{ //<----- Actor (mainThread)
            data.append(item1)
            data.append(item2)

            
            //will be in main thread again
            let item3 = "Item3: Main Thread"
            data.append(item3)
        }
        
    }
}

struct AsyncAwaitThreading59: View {
    @StateObject var viewModel = AsyncAwaitViewModel()
    
    var body: some View {
        List(viewModel.data, id: \.self){item in
            Text(item)
        }
            .onAppear{
                Task{await viewModel.addItem()} //<----- Task
            }
    }
}

struct AsyncAwaitThreading59_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitThreading59()
    }
}
