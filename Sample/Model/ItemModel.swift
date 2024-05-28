//
//  ItemModel.swift
//  Sample
//
//  Created by Julian on 5/24/24.
//

import Foundation

struct ItemModel: Codable, CustomStringConvertible {
    let status: String?
    let totalCnt: Int?
    let items: [ItemDetail]?
    var description: String {
        return "status: \(status ?? "") / totalCnt: \(totalCnt ?? 0)"
    }
    private enum CodingKeys: String, CodingKey {
        case status
        case items = "articles"
        case totalCnt = "totalResults"
    }
    
    static func getDummy() -> Self {
        return Dummys.itemModelDummy
    }
}


struct ItemDetail: Codable, Identifiable {
    var id = UUID()
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    var isChecked: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content, isChecked
    }
    
    var getImageUrl: URL? {
        get {
            URL(string: urlToImage ?? "")
        }
    }
    
    var getPublishedAt: String {
        get {
            DateFormatter.dateFromISOString.date(from: publishedAt ?? "")!.dateToString()
            
            
        }
    }
    var getPublishedAtDisplay: String {
        get {
            DateFormatter.dateFromISOString.date(from: publishedAt ?? "")!.timeAgoDisplay()
        }
    }
    
    static func getDummy() -> Self {
        return Dummys.itemDetailDummy
    }
    
    // NewsData 를 Local Data 로 변환
    func convertToNewsLocalData() -> NewsLocalData {
        return NewsLocalData(
            id: self.id.uuidString,
            title: self.title ?? "",
            content: self.description ?? "",
            url: self.url ?? "",
            urlToImage: self.urlToImage ?? "",
            publishedAt: self.publishedAt ?? "",
            isChecked: self.isChecked ?? false
        )
    }
}

struct Source: Codable {
    let source: String
    private enum CodingKeys: String, CodingKey {
        case source = "name"
    }
    
    static func getDummy() -> Self {
        return Source(source: "")
    }
}
