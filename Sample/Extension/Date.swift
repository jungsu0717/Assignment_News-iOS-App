//
//  Date.swift
//  Sample
//
//  Created by Julian on 5/27/24.
//

import Foundation

extension Date {
    
    // Date -> String
    func dateToString() -> String {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = myFormatter.string(from: self)
        return dateString
    }
    
    // 날짜 표현 형식 변경
    func timeAgoDisplay() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year], from: self, to: now)
        
        if let year = components.year, year >= 2 {
            return "\(year)년 전"
        } else if let month = components.month, month >= 2 {
            return "\(month)개월 전"
        } else if let month = components.month, month >= 1 {
            return "지난 달"
        } else if let weekOfYear = components.weekOfYear, weekOfYear >= 2 {
            return "\(weekOfYear)주 전"
        } else if let weekOfYear = components.weekOfYear, weekOfYear >= 1 {
            return "지난 주"
        } else if let day = components.day, day >= 2 {
            return "\(day)일 전"
        } else if let day = components.day, day >= 1 {
            return "어제"
        } else if let hour = components.hour, hour >= 2 {
            return "\(hour)시간 전"
        } else if let minute = components.minute, minute >= 1 {
            return "\(minute)분 전"
        } else {
            return "방금"
        }
    }
    
    
}
