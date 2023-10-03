//
//  Escaping56.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 28.09.23.
//

import SwiftUI

//takeaways:
//0. (kinda useless as async await is in most cases better?)
//1. a way to write async code in swift
//2. instead functions will have another with @escaping marked function as parameter which will "handle" the async data "onCompletion"
//3. if the "async" function gets called, the passed in @escaping function might need self. or weak.self if it changes local vars
//4. for cleaner / multiple data return, escaping function takes a struct model with all the data, instead many single parameters
//5. (of-course the @escaping "parameter functions" can also have a return different from void, but its not used in these examples)
//6. important: to understand how functions as inputs work (example at: Async Model)

class ViewModel: ObservableObject {
    @Published var text = "Hello"
    
    //MARK: - Sync
    func getNewDataSync() {
        let newData = downloadSync()
        text = newData
    }
    
    func downloadSync() -> String {
        return "New sync data!"
    }
    
    //MARK: - Async
    func getNewDataAsync(){
        downloadAsync { data in
            self.text = data
        }
    }
    
    //functions as parameters can not have named arguments: so either "_ internalName: Type", or just "Type"
    func downloadAsync(onCompletion: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onCompletion("New async data!")
        }
    }
    
    //MARK: - Async Model
    ///instead of many single parameters
    struct DownloadResult {
        let data: String
        let other: Bool
        ///...
    }
    func getNewDataAsyncModel(){
        ///def of function (what shall the function do)
        downloadAsyncModel { resultModel in
            self.text = resultModel.data
        }
    }
    ///worse code, but easier to understand functions as parameters
    func getNewDataAsyncModelEasierToUnderstand(){
        ///def of function (what shall the function do)
        func updateData( resultModel: DownloadResult) -> Void {
            self.text = resultModel.data
        }
        downloadAsyncModel(onCompletion: updateData)
    }
    
    ///give me a function with following declaration as input
    func downloadAsyncModel(onCompletion: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            ///call the function you gave me as input
            onCompletion(DownloadResult(data: "New async data from model", other: true))
        }
    }
}

struct Escaping56: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            Text(vm.text)
            Button("Sync", action: vm.getNewDataSync)
            Button("Async", action: vm.getNewDataAsync)
            Button("AsyncModel", action: vm.getNewDataAsyncModel)
                
        }.font(.title.bold())
        
    }
}

struct Escaping56_Previews: PreviewProvider {
    static var previews: some View {
        Escaping56()
    }
}
