//
//  DECNew.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 16.02.2023.
//
import Foundation

struct DECNew {
	
    let title: String
    let date: String
    let photoURL: String
    let post: String
    let city: String?
	
	enum CodingKeys: String, CodingKey {
		
        case date
        case photoURL
        case post
        case title
        case city
	}
}
extension DECNew: Codable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try values.decode(String.self, forKey: .title)
		self.date = try values.decode(String.self, forKey: .date)
        self.photoURL = try values.decode(String.self, forKey: .photoURL)
        self.post = try values.decode(String.self, forKey: .post)
        self.city = try? values.decode(String?.self, forKey: .city)
	}
}
