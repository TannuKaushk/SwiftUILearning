//
//  DataServiceManager.swift
//  ColourGame
//
//  Created by Kaushik on 19/01/24.
//

import Foundation
import SwiftUI
import Combine




protocol DataServiceProtocol {
    func downloadItemWithEscaping(completion: @escaping(_ item: [String]) -> ())
    func downloadItemWithCombine() -> AnyPublisher<[String], Error>
}



class MockDataService: DataServiceProtocol {
    
    var item: [String]
  
    init(item: [String]?) {
        self.item = item ?? ["One","Two","Three"]
    }
    
    func downloadItemWithEscaping(completion: @escaping(_ item: [String]) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(self.item)
        }
    }
    
    func downloadItemWithCombine() -> AnyPublisher<[String], Error> {
        Just(item)
            .tryMap({ publishItems in
                guard !publishItems.isEmpty else {
                    throw handleError.invalidUrl
                }
                return publishItems
            })
            .eraseToAnyPublisher()
    }
}
