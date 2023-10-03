//
//  UnitTestingViewModel55_Tests.swift
//  LearningSwiftAppTests
//
//  Created by Thore Brehmer on 28.09.23.
//

import XCTest

//(0. rule: test each struct/class/part in its own file)
//1. file naming: FilenameWhichIsTested_Tests
//2. test naming: test_UnitOfWork_StateUnderTest_ExpectedBehavior_optStress
//                      test_[struct or class]_[variable or function]_[expected result]_[stress(if random loop)]
//3. test structure: Given (Arrange), When (Act), Then (Assert)
//4. Use Whitebox edge cases + known "horoscope cases" (long inputs, gibberish, ...) + random cases
//4. there are many XCTAssert to use
//5. multiple asserts can be grouped into one test (group if same var/func and same "function"/result is tested) (e.g. add(x) works: add(0), add(-10), add(10))
//6. async code: @escape, combine and async code can be tested with different ways
// 6.1 async: test for errors
// 6.2 escaping...
// 6.3 combine...
//7. package has to be imported with @testable
@testable import LearningSwiftApp

final class UnitTestingViewModel55_Tests: XCTestCase {

    //MARK: Init / De-init
    //can be used if multiple tests need access on the same data
    //or if initialising of data is complex / to time consuming for doing it in every test separate
    var viewModel: UnitTestingViewModel?
    override func setUpWithError() throws {
        /// Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingViewModel(isPremium: .random())
    }

    //use if using class data / init: deInit/destroy/reset them
    override func tearDownWithError() throws {
        /// Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    //use guard let when using the class data
    func test_whichUsesInitDeInit(){
        //Given (Arrange)
        guard let viewModel = viewModel else {
            XCTFail()
            return
        }
        
        //When (Act)
        
        //Then (Assert)

    }
    
    //MARK: - Predefined tests
    func testExample() throws {
        /// This is an example of a functional test case.
        /// Use XCTAssert and related functions to verify your tests produce the correct results.
        /// Any test you write for XCTest can be annotated as throws and async.
        /// Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        /// Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        /// This is an example of a performance test case.
        self.measure {
            /// Put the code you want to measure the time of here.
        }
    }
    
    //MARK: - Start of own tests (Sync)
    
    //MARK: Simple test
    func test_UnitTestingViewModel_isPremium_shouldBeTrue(){
        //Given (Arrange)
        let isPremium = true
        
        //When (Act)
        let vm = UnitTestingViewModel(isPremium: isPremium)
        
        //Then (Assert)
        XCTAssertTrue(vm.isPremium)
    }
    
    //MARK: Random
    //testing random is better in this case
    //for random its also safer to stress test is -> so hopefully all edge-cases will be caught
    func test_UnitTestingViewModel_isPremium_shouldInjectedValue_stress(){
        for _ in 0...10 {
            //Given (Arrange)
            let isPremium = Bool.random()
            
            //When (Act)
            let vm = UnitTestingViewModel(isPremium: isPremium)
            
            //Then (Assert)
            XCTAssertEqual(vm.isPremium, isPremium)
        }
    }
    
    //MARK: With Logic
    //When (Act): can have much logic & vars to setup the assert/test
    func test_UnitTestingViewModel_dataArray_shouldAddItems_stress(){
        //Given (Arrange)
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //When (Act)
        let itemsToAdd = Int.random(in: 1...100)
        for _ in 1...itemsToAdd {
            //create random string
            var randomString = ""
            for _ in 0...Int.random(in: 0...100){
                randomString.append("abcdefghijklmnopqrstuvwxyz".randomElement()!)
            }
            vm.addData(randomString)
        }
        
        //Then (Assert)
        XCTAssertEqual(vm.dataArray.count, itemsToAdd)
    }
    
    //MARK: grouped asserts
    func test_UnitTestingViewModel_init_doesSetValuesCorrectly() {
        //Given (Arrange)
        let items1: [String] = []
        let items2: [String] = [UUID().uuidString, UUID().uuidString]
        let isPremium1 = true
        let isPremium2 = false
        
        //When (Act)
        let vm1 = UnitTestingViewModel(isPremium: isPremium1, dataArray: items1 )
        let vm2 = UnitTestingViewModel(isPremium: isPremium1, dataArray: items2 )
        let vm3 = UnitTestingViewModel(isPremium: isPremium2, dataArray: items1 )
        let vm4 = UnitTestingViewModel(isPremium: isPremium2, dataArray: items2 )
        
        //Then (Assert)
        XCTAssertTrue(vm1.isPremium)
        XCTAssertTrue(vm2.isPremium)
        XCTAssertFalse(vm3.isPremium)
        XCTAssertFalse(vm4.isPremium)
        XCTAssertTrue(vm1.dataArray.isEmpty)
        XCTAssertTrue(vm3.dataArray.isEmpty)
        XCTAssertEqual(vm2.dataArray.count, items2.count)
        XCTAssertEqual(vm4.dataArray.count, items2.count)
    }
    
    //MARK: Throws Error
    //error throws can also be tested
    //needs try, and as? casting for error equality testing
    //there are 2 ways to test for error throws
    func test_UnitTestingViewModel_saveItem_itemNotFound(){
        //Given (Arrange)
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //When (Act)
        
        //Then (Assert)
        //V1
        XCTAssertThrowsError(try vm.saveItem(" ")) //catches any error
        XCTAssertThrowsError(try vm.saveItem(" "), "some message") { error in
            //use this version to test the error type
            XCTAssertEqual(error as? UnitTestingViewModel.DataError, UnitTestingViewModel.DataError.itemNotFound)
        }
        
        //V2
        do {
            try vm.saveItem(" ")
        } catch let error {
            XCTAssertEqual(error as? UnitTestingViewModel.DataError, UnitTestingViewModel.DataError.itemNotFound)
        }
    }
    
    //MARK: Test no error thrown
    //(similar to throws error)
    func test_UnitTestingViewModel_saveItem_shouldSaveItem(){
        //Given (Arrange)
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //When (Act)
        vm.addData("data")
        
        //Then (Assert)
        //V1
        XCTAssertNoThrow(try vm.saveItem("data"))
        
        //V2
        do {
            try vm.saveItem("data")
        } catch {
            XCTFail()
        }
    }
    
    //MARK: Async Tests
    //tests if async func throws error
    func test_UnitTestingViewModel_downloadDataAsync_ShouldWork_WithAsync() async {
        //Given (Arrange)
        let vm = UnitTestingViewModel(isPremium: .random())
        
        //When (Act)
        var throwedError: Error?
        do{
            try await vm.downloadDataAsync()
        }catch {
            throwedError = error
        }
        
        //Then (Assert)
        XCTAssertNoThrow(throwedError)
        XCTAssertTrue(!vm.dataArray.isEmpty)
        print("\(vm.dataArray)")
    }
    
//    //TODO: escaping 1:20:00
//    func test_UnitTestingViewModel_downloadData_ShouldBeAsync() {
//        //Given (Arrange)
//        let vm = UnitTestingViewModel(isPremium: Bool.random())
//
//        //When (Act)
//        vm.downloadData()
//
//
//        //Then (Assert)
//    }
//
//    //TODO: combine https://www.youtube.com/watch?v=eqdvIUKsM2A&t=9s
//    func test_UnitTestingViewModel_downloadDataCombine_ShouldBeAsync() {
//        //Given (Arrange)
//        <#code#>
//        //When (Act)
//        <#code#>
//        //Then (Assert)
//        <#code#>
//    }
}


