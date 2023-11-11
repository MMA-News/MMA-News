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
	
	private let fightersCollection = "new_fighters" //Fighters
	private let tournamentColection = "new_tournaments" // tournaments
	private let pairOfFightersCollection = "pairOfFighters" // pairOfFighters
	private let ticketsCollection = "tickets" // tickets
	private let newsCollection = "news" // news
	private let mediaCollection = "media" // media
	
	private let firestoreService: FirestoreService
	
	init(
		firestoreService: FirestoreService
	) {
		self.firestoreService = firestoreService
	}
	
	private let reference = Firestore.firestore()
	
	
	//GET
	
	func getFighters(completion: @escaping ClosureResult<[DECFighter]>) {
		var getFightersRequestData = GetFightersRequestData()
		getFightersRequestData.collectionReference = reference.collection(fightersCollection)
		
		self.firestoreService.get(
			requestData: getFightersRequestData,
			completion: completion
		)
	}
	
	func getPairOfFighters(with documentID: String, completion: @escaping ClosureResult<[DECPairOfFighter]>) {
		var getFightersRequestData = GetPairOfFightersRequestData()
		getFightersRequestData.collectionReference = reference.collection(pairOfFightersCollection)
		
		self.firestoreService.get(
			requestData: getFightersRequestData,
			completion: completion
		)
	}
	
	func getNews(completion: @escaping ClosureResult<[DECNew]>) {
		var getNewsRequestData = GetNewsRequestData()
		getNewsRequestData.collectionReference = reference.collection(newsCollection)
		
		self.firestoreService.get(
			requestData: getNewsRequestData,
			completion: completion
		)
	}
	
	func getTournaments(completion: @escaping ClosureResult<[DECTournament]>) {
		var getTournamentsRequestData = GetTournamentsRequestData()
		getTournamentsRequestData.collectionReference = reference.collection(tournamentColection)
		
		self.firestoreService.get(
			requestData: getTournamentsRequestData,
			completion: completion)
	}
	
	func getTickets(userID: String, completion: @escaping ClosureResult<[DECTicket]>) {
		var getTicketsRequestData = GetTicketsRequestData()
		getTicketsRequestData.collectionReference = reference
			.collection(ticketsCollection)
			.document("users")
			.collection(userID)
		
		self.firestoreService.get(
			requestData: getTicketsRequestData,
			completion: completion
		)
	}
	
	func getMedia(completion: @escaping ClosureResult<[DECMedia]>) {
		var getMediaRequestData = GetMediaRequestData()
		getMediaRequestData.collectionReference = reference.collection(mediaCollection)
		
		self.firestoreService.get(
			requestData: getMediaRequestData,
			completion: completion
		)
	}
	
	//POST
	
	func postTicket(ticket: DECTicket, userID: String, completion: @escaping ClosureResult<DECTicket>) {
		var postTicketRequestData = PostTicketRequestData()
		postTicketRequestData.data = ticket
		postTicketRequestData.documentReference = reference
			.collection(ticketsCollection)
			.document("users")
			.collection(userID).document(UUID().uuidString.encodeBase64())
		
		self.firestoreService.save(
			requestData: postTicketRequestData,
			completion: completion
		)
	}
}
