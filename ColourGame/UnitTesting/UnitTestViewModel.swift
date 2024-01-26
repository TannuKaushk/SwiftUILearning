//
//  UnitTestViewModel.swift
//  ColourGame
//
//  Created by Kaushik on 16/01/24.
//

import Foundation
import SwiftUI
import Combine



class UnitTestViewModel: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray:[String] = []
    @Published var selectedItem: String? = nil
    
    var dataServiceProtocol: DataServiceProtocol
    init(isPremium: Bool, dataServiceProtocol: DataServiceProtocol = MockDataService(item: nil) ) {
        self.isPremium = !isPremium
        self.dataServiceProtocol = dataServiceProtocol
    }
    
    func addItemInDataArray(item: String) {
        guard item != "" else {
            return
        }
        dataArray.append(item)
    }
    
    func selectItem(item: String) {
        if let x = dataArray.first(where: { $0 == item }) {
            selectedItem = x
        }
    }
    
    func saveItem(item: String) throws {
        guard !item.isEmpty else {
            throw DataError.noData
        }
        if let x = dataArray.first(where: {$0 == item }) {
           print("Save Item here\(x)")
        } else {
            throw DataError.itemNotFound
        }
    }
    
    
    func downloadWithEscaping() {
        dataServiceProtocol.downloadItemWithEscaping(completion: { item in
            self.dataArray = item
        })
    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
}
