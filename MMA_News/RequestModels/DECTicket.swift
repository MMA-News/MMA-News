//
//  DECTicket.swift
//  MMA_News
//
//  Created by Senior Developer on 09.11.2023.
//

import Foundation

struct DECTicket {
	
	let date: String
	let leftPhotoUrl: String
	let rightPhotoUrl: String
	let photoURL: String
	let city: String?
	let title: String
	let qrUrl: String
	let isPayment: Bool
	
	enum CodingKeys: String, CodingKey {
		case date
		case rightPhotoUrl = "blue"
		case leftPhotoUrl = "red"
		case city
		case title
		case photoURL
		case qrUrl
		case isPayment
	}
}
extension DECTicket: Codable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.date = (try? values.decode(String.self, forKey: .date)) ?? ""
		self.leftPhotoUrl = (try? values.decode(String.self, forKey: .leftPhotoUrl)) ?? ""
		self.rightPhotoUrl = (try? values.decode(String.self, forKey: .rightPhotoUrl)) ?? ""
		self.photoURL = (try? values.decode(String.self, forKey: .photoURL)) ?? ""
		self.city = (try? values.decode(String?.self, forKey: .city)) ?? ""
		self.title = (try? values.decode(String.self, forKey: .title)) ?? ""
		self.qrUrl = (try? values.decode(String.self, forKey: .qrUrl)) ?? ""
		self.isPayment = (try? values.decode(Bool.self, forKey: .isPayment)) ?? false
	}
}

