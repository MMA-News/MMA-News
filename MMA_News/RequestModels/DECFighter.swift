//
//  DECFighter.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 12.02.2023.
//
import Foundation

struct DECFighter {
	
    let name: String
    let city: String
    let fights: String
    let club: String
    let photoURL: String
	
	enum CodingKeys: String, CodingKey {
        case name
        case city
        case fights
        case club
        case photoURL
	}
}
extension DECFighter: Codable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.name = (try? values.decode(String.self, forKey: .name)) ?? "" 
        self.city = (try? values.decode(String.self, forKey: .city)) ?? "" 
        self.fights = (try? values.decode(String.self, forKey: .fights)) ?? "" 
        self.club = (try? values.decode(String.self, forKey: .club)) ?? "" 
        self.photoURL = (try? values.decode(String.self, forKey: .photoURL)) ?? "" 
	}
}
