//
//  SwiftUIDependencyInjection.swift
//  ColourGame
//
//  Created by Kaushik on 15/01/24.
//

import SwiftUI
import Combine

enum handleError: Error {
   case invalidUrl
}

struct PostModel: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}

protocol ManageApi {
    func getData() -> AnyPublisher<[PostModel], Error>
}

class productionDataService : ManageApi  {
    
    func getData() -> AnyPublisher<[PostModel], Error> {
         let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
         
        
        return URLSession.shared.dataTaskPublisher(for: url).map({$0.data}).decode(type: [PostModel].self, decoder: JSONDecoder()).receive(on: DispatchQueue.main).eraseToAnyPublisher()
        
    }
    
}

class MockTextData : ManageApi {
    let postModel = [PostModel(userId: 1,id: 1,title: "TestOne",body: "Yes"),
                     PostModel(userId: 2,id: 2,title: "TestTwo",body: "Now")]
    func getData() -> AnyPublisher<[PostModel], Error> {
        Just(postModel).tryMap({ $0 }).eraseToAnyPublisher()
    }
    
    
}


class DependencyViewModel: ObservableObject {
   @Published var postModelArray: [PostModel] = []
    let dataSerivce: MockTextData
    var cancellables = Set<AnyCancellable>()
    init(dataSerivce: MockTextData) {
        self.dataSerivce = dataSerivce
        lostPost()
    }
    
    func lostPost() {
        dataSerivce.getData().sink { _ in
           
        } receiveValue: { [weak self] returnedPosts in
            self?.postModelArray = returnedPosts
        }.store(in: &cancellables)

    }
}
struct SwiftUIDependencyInjection: View {
    @StateObject private var vm: DependencyViewModel
    
    init(dataSerivce: MockTextData) {
       _vm = StateObject(wrappedValue: DependencyViewModel(dataSerivce: dataSerivce))
    }
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.postModelArray) { post in
                    Text(post.title ?? "")
                }
            }
        }
    }
}

#Preview {
   
        SwiftUIDependencyInjection(dataSerivce:  MockTextData())
    }

