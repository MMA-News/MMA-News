//
//  GetRequestsFirebaseService.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 12.02.2023.
//
import FirestoreSDK
import FirebaseFirestore
import Foundation

struct GetRequestsFirebaseService {
    
    private let firestoreService: FirestoreService
    
    init(
        firestoreService: FirestoreService
    ) {
        self.firestoreService = firestoreService
    }
    
    private let reference = Firestore.firestore()
    
    func getFighters(completion: @escaping ClosureResult<[DECFighter]>) {
        var getFightersRequestData = GetFightersRequestData()
        getFightersRequestData.collectionReference = reference.collection("Fighters")
        
        self.firestoreService.get(
            requestData: getFightersRequestData,
            completion: completion
        )
    }
    
    func getPairOfFighters(with documentID: String, completion: @escaping ClosureResult<[DECPairOfFighter]>) {
        var getFightersRequestData = GetPairOfFightersRequestData()
        getFightersRequestData.collectionReference = reference.collection("pairOfFighters")
        
        self.firestoreService.get(
            requestData: getFightersRequestData,
            completion: completion
        )
    }
    
    func getNews(completion: @escaping ClosureResult<[DECNew]>) {
        var getNewsRequestData = GetNewsRequestData()
        getNewsRequestData.collectionReference = reference.collection("news")
        
        self.firestoreService.get(
            requestData: getNewsRequestData,
            completion: completion
        )
    }
    
    func getTournaments(completion: @escaping ClosureResult<[DECTournament]>) {
        var getTournamentsRequestData = GetTournamentsRequestData()
        getTournamentsRequestData.collectionReference = reference.collection("tournaments")
        
        self.firestoreService.get(
            requestData: getTournamentsRequestData,
            completion: completion)
    }
    
    func getMedia(completion: @escaping ClosureResult<[DECMedia]>) {
        var getMediaRequestData = GetMediaRequestData()
        getMediaRequestData.collectionReference = reference.collection("media")
        
        self.firestoreService.get(
            requestData: getMediaRequestData,
            completion: completion
        )
    }
}
