//
//  DECPairOfFighter.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import Foundation

struct DECPairOfFighter {
    
    let firstName: String
    let secondName: String
    let city: String
    let fights: String
    let weight: String
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case secondName
        case city
        case fights
        case weight
    }
}
extension DECPairOfFighter: Codable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = (try? values.decode(String.self, forKey: .firstName)) ?? ""
        self.secondName = (try? values.decode(String.self, forKey: .secondName)) ?? ""
        self.city = (try? values.decode(String.self, forKey: .city)) ?? ""
        self.fights = (try? values.decode(String.self, forKey: .fights)) ?? ""
        self.weight = (try? values.decode(String.self, forKey: .weight)) ?? ""
    }
}
