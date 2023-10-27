//
//  GetMediaRequestData.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 19.02.2023.
//
import FirebaseFirestore
import FirestoreSDK
import Foundation

struct GetMediaRequestData: RequestData {
   
    var collectionReference: CollectionReference?
    var documentReference: DocumentReference?
    var data: DECMedia? = nil
}
