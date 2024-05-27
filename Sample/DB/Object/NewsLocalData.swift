//
//  RealmSwift.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import RealmSwift

class NewsLocalData: Object, Codable {
    @Persisted(primaryKey: true) var _id: ObjectId   // primary key로 지정
    @Persisted var title: String
    @Persisted var content: String
    @Persisted var url: String
    @Persisted var urlToImage: String
    
    @Persisted var publishedAt: String
    @Persisted var isChecked: Bool

    convenience init(title: String, content: String? = nil, url: String, urlToImage: String, publishedAt: String, isChecked: Bool = false) {
         self.init()
         self.title = title
         if let content = content, !content.isEmpty {
             self.content = content
         }
         self.url = url
         self.urlToImage = urlToImage
         self.publishedAt = publishedAt
         self.isChecked = isChecked
    }
    
    // Local Data 를 NewsData 로 변환
    func convertToItemDetail() -> ItemDetail {
        return ItemDetail(
            source: Source.getDummy(),
            author: nil,
            title: self.title,
            description: self.content,
            url: self.url,
            urlToImage: self.urlToImage,
            publishedAt: self.publishedAt,
            content: nil,
            isChecked: self.isChecked
        )
    }
}
