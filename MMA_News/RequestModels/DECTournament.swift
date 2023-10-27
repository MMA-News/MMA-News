//
//  DECTournament.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 19.02.2023.
//
import Foundation

struct DECTournament {
	
    let date: String
    let leftPhotoUrl: String
    let rightPhotoUrl: String
    let photoURL: String
    let city: String?
    let post: String
    let title: String
    let pairs: [DECPair]?
    
    enum CodingKeys: String, CodingKey {
        case date
        case rightPhotoUrl = "blue"
        case leftPhotoUrl = "red"
        case city
        case title
        case post
        case photoURL
        case pairs
    }
}
extension DECTournament: Codable {
	
	init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.date = (try? values.decode(String.self, forKey: .date)) ?? "" 
        self.leftPhotoUrl = (try? values.decode(String.self, forKey: .leftPhotoUrl)) ?? ""
        self.rightPhotoUrl = (try? values.decode(String.self, forKey: .rightPhotoUrl)) ?? ""
        self.photoURL = (try? values.decode(String.self, forKey: .photoURL)) ?? ""
        self.city = (try? values.decode(String?.self, forKey: .city)) ?? ""
        self.title = (try? values.decode(String.self, forKey: .title)) ?? ""
        self.post = (try? values.decode(String.self, forKey: .post)) ?? ""
        self.pairs = try? values.decode([DECPair]?.self, forKey: .pairs)
	}
}
