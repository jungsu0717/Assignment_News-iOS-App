//
//  DateUtils.swift
//  Sample
//
//  Created by Julian on 5/28/24.
//

import Foundation

class DateUtils {
    
    static let instance = DateUtils()
    private init() {}
    
    func compareISODate(targetString: String?, fromString: String?) -> Bool {
        
        guard let target = targetString else { return true }
        guard let from = fromString else { return true }
        
        if let targetDate: Date = DateFormatter.dateFromISOString.date(from: target),
      
        let fromDate: Date = DateFormatter.dateFromISOString.date(from: from) {
            
            switch targetDate.compare(fromDate) {
                case .orderedSame: return true
                case .orderedDescending: return true
                case .orderedAscending: return false
                }
        }
        return true
    }
}
