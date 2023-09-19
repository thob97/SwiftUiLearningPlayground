//
//  UnWrapGuard45.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 19.09.23.
//

import SwiftUI

//takeaways:
//1. always try to use if let & guard let instead of ! -> makes code more cleaner & robust (safe unwrap instead of forced)
//2. most of the time guard is cleaner
//3. there are four ways to unwrap:
// 3.1 force unwrap ! (worst)
// 3.1.1 only for single line code: condition ? : (TODO: view only accepts same return view types)
// 3.1.2 if else
// 3.2 only for single line code ?? (-> restricted in use)
// 3.3 if let
// 3.4 guard let (best) (can not be used inside view -> has to be used in func)
// (4. DispatchQueue.main.asyncAfter(deadline: .now() + 3){} can be used for delayed action)
// (5. ProgressView() is a nice progressIndicator)

struct UnWrapGuard45: View {
    @State var data: String?
    
    var body: some View {
        
        NavigationStack{
            ScrollView {
                VStack(spacing:50){
                    //3.1 forced unwraping will cause error
                    //Text(data!)
                    
                    //3.1.1
                    VStack(spacing:0){
                        Text("Using con ? :").font(.headline)
                        //
                        data == nil ? Text("not fetched yet") : Text(data!)
                    }
                     
                    //3.1.2
                    VStack(spacing:0){
                        Text("Using if else").font(.headline)
                        //
                        if data != nil {
                            Text(data!)
                        } else {
                            ProgressView()
                        }
                    }
                    
                    //3.2
                    VStack(spacing:0){
                        Text("Using ??").font(.headline)
                        //
                        Text(data ?? "not fetched yet")
                    }
                    
                    //3.3
                    VStack(spacing:0){
                        Text("Using if let").font(.headline)
                        //
                        if let data = data {
                            Text(data)
                        } else {
                            ProgressView()
                        }
                    }
                    
                    //3.4
                    VStack(spacing:0){
                        Text("Using guard let").font(.headline)
                        //
                        Text(useGuard())
                    }
                }
                .navigationTitle(Text("Unwraping"))
            .onAppear(perform: fetchData)
            }
        }
        
    }
    
    //
    func useGuard() -> String {
        guard let data = data else {
            return "not fetched yet"
        }
        return data
    }
    
    func fetchData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            data = "Data Loaded"
        }
    }
}

struct UnWrapGuard45_Previews: PreviewProvider {
    static var previews: some View {
        UnWrapGuard45()
    }
}
