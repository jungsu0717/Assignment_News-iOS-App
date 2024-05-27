//
//  Array.swift
//  Sample
//
//  Created by Julian on 5/26/24.
//

import Foundation

extension Array {
    func groupBy(by groupSize: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: groupSize).map {
            Array(self[$0..<Swift.min($0 + groupSize, count)])
        }
    }
}
