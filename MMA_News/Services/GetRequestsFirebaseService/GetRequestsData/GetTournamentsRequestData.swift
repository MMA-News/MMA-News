//
//  GetTournamentsRequestData.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 12.02.2023.
//
import FirestoreSDK
import FirebaseFirestore
import Foundation

struct GetTournamentsRequestData: RequestData {
    
    var collectionReference: CollectionReference?
    var documentReference: DocumentReference?
    var data: DECTournament? = nil
}
