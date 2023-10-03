//
//  UnitTestingViewModel55.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 28.09.23.
//

import Foundation
import SwiftUI

//go to tests folder for the remaining files
class UnitTestingViewModel: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    
    init(isPremium:Bool, dataArray:[String] = []){
        self.isPremium = isPremium
        self.dataArray = dataArray
    }
    
    //MARK: For Sync Testing
    
    func addData(_ data: String){
        guard !data.isEmpty else {return}
        dataArray.append(data)
    }
    
    enum DataError: Error {
        case noData
        case itemNotFound
    }
    
    func saveItem(_ item: String) throws {
        guard !item.isEmpty else {throw DataError.noData}
        guard dataArray.contains(where: {$0 == item}) else {throw DataError.itemNotFound}
        print("do some save logic here")
    }
    
    //MARK: For Async Testing
    let dataService = MockDataService() //should normally use protocol and init, but for this simple example will be hardcoded
    func downloadDataEscaping(){
        dataService.downloadWithEscaping { items in
            self.dataArray = items
        }
    }
    
    func downloadDataAsync() async throws {
        dataArray = try await dataService.downloadWithAsync()
    }
}


//MARK: - MockedDataService
//interface
protocol DataServiceProtocol {
    func downloadWithEscaping(onCompletion: @escaping ([String]) -> Void)
}

//simulates a async download of data
class MockDataService: DataServiceProtocol {
    func downloadWithAsync() async throws -> [String] {
        try await Task.sleep(for: .seconds(10))
        return ["Example", "Items", "Which", "Were", "Downloaded", "By", "Async", "Func"]
    }
    
    
    func downloadWithEscaping(onCompletion: @escaping ([String]) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onCompletion(["Example", "Items", "Which", "Were", "Downloaded"])
        }
    }
    
    //TODO: combine 1:15:00 https://www.youtube.com/watch?v=eqdvIUKsM2A&t=9s
    
}
