//
//  DataServiceManager_Tests.swift
//  ColourGame_Tests
//
//  Created by Kaushik on 19/01/24.
//

import XCTest
@testable import ColourGame
import Combine

final class DataServiceManager_Tests: XCTestCase {

    var calcellable = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        calcellable.removeAll()
    }


    
    func test_MockDataService_init_shouldCheckingEveryCases() {
        //Given
        var item1 : [String]? = nil
        var item2 : [String]? = []
        var item3 : [String]? = [UUID().uuidString, UUID().uuidString, UUID().uuidString]
        //When
        let vm1 = MockDataService(item: item1)
        let vm2 = MockDataService(item: item2)
        let vm3 = MockDataService(item: item3)
        //Then
        XCTAssertFalse(vm1.item.isEmpty)
        XCTAssertTrue(vm2.item.isEmpty)
        XCTAssertEqual(vm3.item.count, item3?.count)
    }
    
    func test_MockDataService_downloadItemWithEscaping_DoesReturnValue() {
        //Given
        let vm = MockDataService(item: nil)
        //When
        var newItem: [String] = []
        let expectation = XCTestExpectation()
        vm.downloadItemWithEscaping { returnItem in
            expectation.fulfill()
            newItem = returnItem
        }
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(newItem, vm.item)
    }
    
    func test_MockDataService_downloadItemWithCombine_DoesReturnValue() {
        //Given
        let vm = MockDataService(item: nil)
        //When
        var newItem: [String] = []
        let expectation = XCTestExpectation()
        vm.downloadItemWithCombine()
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure:
                    XCTFail()
                }
            } receiveValue: { returnItem in
                newItem = returnItem
            }
            .store(in: &calcellable)

        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(newItem, vm.item)
    }
    
    func test_MockDataService_downloadItemWithCombine_CheckError() {
        //Given
        let vm = MockDataService(item: nil)
        //When
        var newItem: [String] = []
        let expectation = XCTestExpectation()
        vm.downloadItemWithCombine()
            .sink { completion in
                switch completion {
                case .finished: break
                   // XCTFail()
                case .failure(let error):
                    let urlError = error as?  handleError
                    XCTAssertEqual(urlError, handleError.invalidUrl)
                    expectation.fulfill()
                }
            } receiveValue: { returnItem in
                newItem = returnItem
            }
            .store(in: &calcellable)

        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(newItem.count, vm.item.count)
    }
    
    

}
