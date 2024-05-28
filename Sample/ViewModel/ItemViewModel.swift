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
    
    private let realmManager = RealmManager.instance
    private let dateUtils = DateUtils.instance
    
    enum ToggleState: Int {
        case gallery = 0
        case list = 1
    }
    
     let BaseUrl = Bundle.main.infoDictionary?["BaseUrl"] as! String
     let APIKey = Bundle.main.infoDictionary?["APIKey"] as! String
    
    init() {
        // 네트워크 가능할 때
        if NetworkReachabilityManager()?.isReachable ?? false {
            print("#### 네트워크 가능 ")
            fetchNewsFromAPI()
        } else {
            print("#### 네트워크 불가능 ")
            fetchNewsFromRealm()
        }
    }
    
    // News data 를 API 를 통해 가져온다.
    func fetchNewsFromAPI() {
        
        AF.request("\(BaseUrl)\(APIKey)")
            .publishDecodable(type: ItemModel.self)
            .compactMap{ $0.value }
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("fetchNews finished")
                    case .failure(let error):
                        // 수신 오류일 경우 저장된 데이터로 보여준다.
                        self.fetchNewsFromRealm()
                        print("Error fetchNews: \(error)")
                    }
            }, receiveValue: { [weak self] receivedValue in
                guard let self = self else { return }
                self.status = receivedValue.status ?? ""
                self.totalCnt = receivedValue.totalCnt ?? 0
                if let list = receivedValue.items, !list.isEmpty {
                    handleNewsData(_list: list)
                }
            }).store(in: &subscription)
    }
    
    // Realm 을 통해 저장된 News data 를 가져온다.
    func fetchNewsFromRealm() {
        
        let savedData = realmManager.read(NewsLocalData.self)
        
        if !savedData.isEmpty {
            setListItems(_list: savedData.map { $0.convertToItemDetail() })
        }
    }
    
    
    // API 를 통해 받아온 데이터와, 기존 저장된 데이터를 비교해서 없는 데이터를 저장한다.
    func handleNewsData(_list: [ItemDetail]) {
        
        // 데이터 비교를 위해 Realm 을 통해 저장된 데이터를 불러온다.
        let savedData = realmManager.read(NewsLocalData.self)
        
        // compare Key 가 없어서 제목이 같지 않은 데이터만 저장하도록 적용
        let newData = _list.filter { newDataItem in
            !savedData.contains { savedDataItem in
                return newDataItem.title == savedDataItem.title
            }
        }.map{ $0.convertToNewsLocalData() }
        
        realmManager.create(newData)
        // 1. 저장된 데이터 전체를 보여줘야 한다면
         let combinedList = Set(newData + savedData)
         setListItems(_list: combinedList.map{ $0.convertToItemDetail() })

        // 2. 새로 받아온 데이터만 보여줘야 한다면.
        // setListItems(_list: _list)
    }
    
    // List 를 정렬해서 설정
    func setListItems(_list: [ItemDetail]) {
        
        let sortedList = _list.sorted(by: { dateUtils.compareISODate(targetString: $0.publishedAt, fromString: $1.publishedAt) })
        
        self.items = sortedList
        self.groupedItems = self.items.groupBy(by: 5)
    }
    
//    // Item 상세페이지 이동 시 isChecked 여부를 UI, DB 에 업데이트
//    func asd(_ itemDetail: ItemDetail) {
//        
//        let savedData = realmManager.read(NewsLocalData.self)
//        
//        let localData = savedData.first { data in data.title == itemDetail.title }
//        
//        itemDetail.isChecked = true
//        
//        if let data = localData {
//            realmManager.update(data) { item in
//                item.isChecked = true
//            }
//        }
//    }
    
    // Item 상세페이지 이동 시 isChecked 여부를 UI, DB 에 업데이트
    func markItemAsChecked(_ item: ItemDetail) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            
            let savedData = realmManager.read(NewsLocalData.self)
            
            items[index].isChecked = true
//            realmManager.update(item) { data in
//                data.isChecked = true
//            }
//            realmManager.update(item, with: ["isChecked": true])
        }
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
