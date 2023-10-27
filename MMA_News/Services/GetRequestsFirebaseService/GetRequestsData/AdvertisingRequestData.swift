//
//  AdvertisingRequestData.swift
//  NEWS_MMA
//
//  Created byNEWS_MMA on 01.04.2023.
//
import FirestoreSDK
import FirebaseFirestore
import Foundation
import AddScreen

struct AdvertisingRequestData: RequestData {
    
    var collectionReference: CollectionReference?
    var documentReference: DocumentReference?
    var data: RequestDataModel?
}
