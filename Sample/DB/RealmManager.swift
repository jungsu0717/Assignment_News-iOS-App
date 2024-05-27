//
//  RealmManager.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import RealmSwift

class RealmManager {
    static let instance = RealmManager()
    
    private let realm: Realm
    
    private init() {
        do {
            realm = try Realm()
            print("Realm data path : \(Realm.Configuration.defaultConfiguration.fileURL!)")
        } catch {
            fatalError(" Realm: Failed to initialize - Error: \(error)")
        }
    }
    // 생성
    func create<T: Object>(_ data: [T]) {
        do {
           try realm.write({
               realm.add(data, update: .modified)
            })
        } catch {
            fatalError("Realm: Failed to create data - Error: \(error)")
        }
    }
    
    // 호출
    func read<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    // 업데이트
    func update<T: Object>(_ data: T, completion: @escaping ((T) -> ())) {
        do {
            try realm.write {
                completion(data)
            }

        } catch let error {
            print(error)
        }
    }
    
    // 삭제
    func delete<T: Object>(_ data: T) {
        do {
           try realm.write{
               realm.delete(data)
            }
        } catch {
            fatalError("Realm: Failed to delete data - Error: \(error)")
        }
    }
    
    // 전체 삭제
    func deleteAll<T: Object>(_ type: T.Type) {
        
        let objects = realm.objects(type)
        
        do {
            try realm.write {
                realm.delete(objects)
            }
        } catch {
            fatalError("Realm: Failed to delete all data - Error: \(error)")
        }
    }
}
