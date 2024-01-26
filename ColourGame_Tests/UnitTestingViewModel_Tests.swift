//
//  UnitTestingViewModel_Tests.swift
//  ColourGame_Tests
//
//  Created by Kaushik on 16/01/24.
//

import XCTest
@testable import ColourGame
import Combine

final class UnitTestingViewModel_Tests: XCTestCase {
    var viewModel: UnitTestViewModel?
    var cancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestViewModel(isPremium: Bool.random())
      
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func test_UnitTestingViewModel_isPremium_shouldBeTrue() {
        //Given
        let userIsPremium: Bool = true
        //When
        let vm = UnitTestViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_dataArray_shouldBeEmpty() {
        //Given
        guard let vm = viewModel else {
            return XCTFail()
        }
        //When
        
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingViewModel_dataArray_shouldAddItem() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItemInDataArray(item: UUID().uuidString)
        }
        //Then
        XCTAssertEqual(vm.dataArray.count, loopCount)
    }
    
    func test_UnitTestingViewModel_dataArray_shouldNotBeEmpty() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        vm.addItemInDataArray(item: "")
        
        //Then
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingViewModel_selectItem_shouldNotBeNil() {
        //Given
        //When
        let vm = UnitTestViewModel(isPremium: Bool.random())
        
        //Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingViewModel_selectItem_shouldBeNilWhenSelectInvalidItem() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        vm.selectItem(item: UUID().uuidString)
        
        //Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingViewModel_selectItem_shouldNotBeNilWhenSelectPresentInDataArray() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        let newItem = UUID().uuidString
        vm.addItemInDataArray(item: newItem)
        vm.selectItem(item: newItem)
        //Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }
    
    func test_UnitTestingViewModel_selectItem_shouldNotBeNilAndSelectedRandomItemAvailableInDataArray() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        let loopCount = Int.random(in: 1..<100)
        var localArray:[String] = []
        for _ in 0..<loopCount {
        let newItem = UUID().uuidString
        vm.addItemInDataArray(item: newItem)
        localArray.append(newItem)
        }
        let item = localArray.randomElement() ?? ""
        vm.selectItem(item: item)
        //Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, item)
    }
    
    
    func test_UnitTestingViewModel_saveItem_shouldBeNilIfDataEmpty() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        
        //Then
        XCTAssertNil(vm.selectedItem)
    }
    func test_UnitTestingViewModel_saveItem_shouldBeNilIfItemNotFound() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        
        //Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Throw error if item not found!") { error in
            let thowerror = error as? UnitTestViewModel.DataError
            XCTAssertEqual(thowerror, UnitTestViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingViewModel_saveItem_SaveItemAvailableInDataArray() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        let loopCount = Int.random(in: 1..<100)
        var loacalArray:[String] = []
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.dataArray.append(newItem)
            loacalArray.append(newItem)
        }
        if let x = loacalArray.randomElement() {
            //Then
            XCTAssertNoThrow(try vm.saveItem(item: x))
        }
    }
    
    func test_UnitTestingViewModel_downloadWithEscaping_ShouldBeReutrnItemArray() {
        //Given
        let vm = UnitTestViewModel(isPremium: Bool.random())
        //When
        let expectation = expectation(description: "Should return item after 3 min")
        vm.$dataArray
            .dropFirst()
            .sink { item in
             
            expectation.fulfill()
        }
        .store(in: &cancellable)
        vm.downloadWithEscaping()
        //Then
        wait(for: [expectation], timeout: 3)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        }
}
