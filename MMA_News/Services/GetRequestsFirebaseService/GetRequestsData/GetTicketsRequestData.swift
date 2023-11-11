//
//  GetTicketsRequestData.swift
//  MMA_News
//
//  Created by IOS Developer on 10.11.2023.
//

import FirestoreSDK
import FirebaseFirestore
import Foundation

struct GetTicketsRequestData: RequestData {
	
	var collectionReference: CollectionReference?
	var documentReference: DocumentReference?
	var data: DECTicket? = nil
}
