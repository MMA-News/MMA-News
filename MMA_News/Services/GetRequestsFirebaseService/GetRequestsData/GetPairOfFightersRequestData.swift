//
//  GetPairOfFightersRequestData.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import FirestoreSDK
import FirebaseFirestore
import Foundation

struct GetPairOfFightersRequestData: RequestData {
    
    var collectionReference: CollectionReference?
    var documentReference: DocumentReference?
    var data: DECPairOfFighter? = nil
}
