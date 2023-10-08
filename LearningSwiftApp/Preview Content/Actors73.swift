//
//  Actors72.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 06.10.23.
//

import SwiftUI

//takeaways:
//0. are thread-safe classes / auto locking data classes
//1. makes hole class async (so that everything needs to be awaited and thus is thread-safe) -> everything needs to be awaited -> if something does not need to be awaited/isolated: can be marked with "nonisolated"
//2. solves the problem that happens if two threads try to access the data at the same time (thread-safe, kirtischer abschnitt)
//3. prev solved with locks (let lock = DispatchQueue() ,... lock.async{} + @escaping onCompletion para)
//4. actors do that ^ for use -> can be written just like a normal function which auto locks

class DataManager {
    
    //singelton
    static let instance = DataManager()
    private init(){}
    
    //
    private let lock = DispatchQueue(label: "")
    func getData(onCompletion: @escaping (_ data: String) -> ()) {
        lock.async {
            //some computation
            onCompletion(UUID().uuidString)
        }
    }
}

actor ActorDataManager {
    //normal data
    nonisolated let data = "does not need to be awaited"
    
    //singelton
    static let instance = ActorDataManager()
    private init(){}
    
    //
    func getData() -> String? {
        //some computation
        return UUID().uuidString
    }
}

struct Actors73: View {
    var body: some View {
        Text("")
    }
}

#Preview {
    Actors73()
}
