//
//  DateFormatter.swift
//  Sample
//
//  Created by Julian on 5/27/24.
//

import Foundation

extension DateFormatter {
    static let dateFromISOString: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return formatter
    }()
}
