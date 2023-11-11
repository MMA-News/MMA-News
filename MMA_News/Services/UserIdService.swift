//
//  UserIdService.swift
//  MMA_News
//
//  Created by IOS Developer on 10.11.2023.
//

import Foundation

struct UserIdService {
	
	private let userDefaultsStandard = UserDefaults.standard
	private let userIDKey = "userID"
	
	func get() -> String {
		if let userID =	userDefaultsStandard.string(forKey: userIDKey) {
			return userID
		} else {
			let userID = UUID().uuidString.encodeBase64()
			userDefaultsStandard.set(userID, forKey: userIDKey)
			return userID
		}
	}
}
