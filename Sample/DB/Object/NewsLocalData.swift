//
//  RealmSwift.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import RealmSwift

class Article: Object {
    @Persisted(primaryKey: true) var _id: ObjectId   // primary key로 지정
    @Persisted var title: String
    @Persisted var favorite: Bool
    @Persisted var content: String
    
    @Persisted var checkBox: Bool
    @Persisted var dateRegistered: Date

     convenience init(content: String, favorite: Bool = false, checkBox: Bool = false, date: Date = Date() ) {
        self.init()
        self.content = content
        self.favorite = favorite
        self.checkBox = checkBox
        self.dateRegistered = date
    }
}
