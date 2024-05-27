//
//  ItemViewModel.swift
//  Sample
//
//  Created by Julian on 5/24/24.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class ItemViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()

    @Published var status = ""
    @Published var totalCnt = 0
    @Published var items = [ItemDetail]()
    @Published var groupedItems = [[ItemDetail]()]
    
    @Published var toggleState = ToggleState.gallery
    @Published var orientation = UIDevice.current.orientation
    @Published var beforeOrientation = UIDevice.current.orientation
    
    enum ToggleState: Int {
        case gallery = 0
        case list = 1
    }
    
     let BaseUrl = Bundle.main.infoDictionary?["BaseUrl"] as! String
     let APIKey = Bundle.main.infoDictionary?["APIKey"] as! String
    
    init() {
        fetchNews()
    }
    
    // News data 를 가져온다.
    func fetchNews() {
        AF.request("\(BaseUrl)\(APIKey)")
            .publishDecodable(type: ItemModel.self)
            .compactMap{ $0.value }
            .sink(receiveCompletion: { completion in
//                switch completion {
//                    case .finished:
//                        print("fetchNews finished")
//                    case .failure(let error):
//                        print("Error fetchNews: \(error)")
//                    }
            }, receiveValue: { [weak self] receivedValue in
                guard let self = self else { return }
                self.status = receivedValue.status ?? ""
                self.totalCnt = receivedValue.totalCnt ?? 0
                if let list = receivedValue.items, !list.isEmpty {
                    self.items = list
                    self.groupedItems = list.groupBy(by: 5)
                }
            }).store(in: &subscription)
    }
    
    /**
     * Portrait List UI 상태 설정
     * 0: gallery, 1: list
     */
    func setToggleState(_state: Int) {
        switch _state{
            case 0:
                toggleState = .gallery
                break
            case 1:
                toggleState = .list
                break
        default:
            break
        }
    }
    
    func setOrientation(_orientation: UIDeviceOrientation) {
        self.beforeOrientation = self.orientation
        self.orientation = _orientation
    }

}
