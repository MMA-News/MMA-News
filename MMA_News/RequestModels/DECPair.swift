//
//  DECPair.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import Foundation

struct DECPair {
    
    let left: String
    let right: String
    let results: String
    let round: String
    let time: String
    
    enum CodingKeys: String, CodingKey {
        
        case left
        case right
        case results
        case round
        case time
    }
}

extension DECPair: Codable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.left = try values.decode(String.self, forKey: .left)
        self.right = try values.decode(String.self, forKey: .right)
        self.results = try values.decode(String.self, forKey: .results)
        self.round = try values.decode(String.self, forKey: .round)
        self.time = try values.decode(String.self, forKey: .time)
    }
}
