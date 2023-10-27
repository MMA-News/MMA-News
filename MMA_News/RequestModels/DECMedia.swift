//
//  DECMedia.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 19.02.2023.
//
import Foundation

struct DECMedia {
	
    let date: String
    let photoURL: String
    let videoURL: String
    let title: String
	
	enum CodingKeys: String, CodingKey {
        case date
        case photoURL
		case videoURL
        case title
	}
}
extension DECMedia: Codable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.date = try values.decode(String.self, forKey: .date)
        self.photoURL = try values.decode(String.self, forKey: .photoURL)
        self.videoURL = try values.decode(String.self, forKey: .videoURL)
        self.title = try values.decode(String.self, forKey: .title)
	}
}
