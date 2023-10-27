//
//  CalculateTimeService.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.03.2023.
//

import Foundation

struct CalculateTimeService {
    private let calendar = Calendar.current
    
    func distance(with date: Date?) -> String? {
        guard let date = date else {
            return ""
        }
        guard let day = calendar.dateComponents([.day], from: Date(), to: date).day else { return nil }
        guard day > 0 else { return nil }
        return day.toString()
    }
}

extension Optional where Wrapped == Int {
    
    func toString() -> String {
        let result = String(self ?? 0)
        return result
    }
}

extension Int {
    
    func toString() -> String {
        let result = String(self)
        return result
    }
}
