//
//  String.swift
//  Sample
//
//  Created by Julian on 5/27/24.
//

import Foundation

extension String {
    
    // ISO String -> Date
    func dateFromISOString() -> Date? {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate]
        return isoDateFormatter.date(from: self)
    }
    
    // String -> Date
    func stringToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: self)
    }
    
}
