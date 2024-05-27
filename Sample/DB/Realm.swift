//
//  Realm.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import RealmSwift

//class Realm {
//    let realm = try! Realm()
//    
//    func create() {
//        // 새로운 객체 생성
//        let data = Diary(content: "오늘의 일기")
//
//        // 데이터 생성 (처음에 데이터가 비어 있기 떄문에 데이터를 add해 주므로써 data 생성)
//        do {
//           try realm.write({
//                realm.add(data)
//            })
//        } catch {
//            print("data 생성에 error가 발생하였습니다..")
//        }
//    }
//    
//    func read() {
//        // 객채 읽어오기
//        let diarys = realm.objects(Diary.self)
//
//        // 필터링 하기
//        let filterContent = diarys.sorted(byKeyPath: "content", ascending: true)    // content내용으로 오름차순
//        let filterContent2 = diarys.filter("content CONTAINS[c] '일기'")    // content에 '일기' 라는 text가 포함 된 것만
//        let filterFavort = diarys.where({ $0.favorite == true })    // favorite 데이터가 true인 것만
//        ...
//    }
//    
//    func update() {
//        // 변경하고자 하는 데이터
//        func update(data: Diary) {
//            do {
//                try realm.write {
//                data.content = "오늘의 일기"
//                }
//            } catch {
//                print("data 생성에 error가 발생하였습니다..")
//            }
//        }
//    }
//    
//    func delete() {
//        // 객채 읽어오기, 제거할 데이터 filter
//        let diarys = realm.objects(Diary.self)
//        let data = diarys.where({ $0.favorite == true })
//         
//        do {
//           try realm.write({
//                realm.delete(data)    // 해당 data만 삭제
//                realm.deleteAll()    // 전체 삭제
//            })
//        } catch {
//            print("메모를 제거하는데 error가 생겼습니다.")
//        }
//    }
//}
