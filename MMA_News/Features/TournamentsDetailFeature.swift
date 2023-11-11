//
//  TournamentsDetailFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import Router
import FirestoreSDK
import UIKit
import RoboKassaSDK

final class TournamentsDetailFeature: BaseFeatureService<TournamentsDetailFeature> {
    
    // MARK: - DI
    private let getRequestsFirebaseService: GetRequestsFirebaseService
    private let routerService: RouterService
    private let warningService: WarningService
	private let roboKassaFeature: RoboKassaFeature
	private let userIdService: UserIdService
    
    init(
        getRequestsFirebaseService: GetRequestsFirebaseService,
        routerService: RouterService,
        warningService: WarningService,
		roboKassaFeature: RoboKassaFeature,
		userIdService: UserIdService
    ) {
        self.getRequestsFirebaseService = getRequestsFirebaseService
        self.routerService = routerService
        self.warningService = warningService
		self.roboKassaFeature = roboKassaFeature
		self.userIdService = userIdService
    }
    
    // MARK: - public methods
    
    func getPairOfFighters(with documentID: String, completion: @escaping Closure<DECPairOfFighter>){
        getRequestsFirebaseService.getPairOfFighters(
            with: documentID) { result in
                switch result {
                    case .object(let pairOfFighters):
                        guard let pairOfFighter = pairOfFighters?.first else { return }
                        completion(pairOfFighter)
                        
                    case .error(let error):
                        print(error?.localizedDescription ?? "")
                }
            }
    }
    
	func didTapBuyTicket(with tournament: DECTournament) {
		if tournament.isPayment {
			let ticket = DECTicket(
				date: tournament.date,
				leftPhotoUrl: tournament.leftPhotoUrl,
				rightPhotoUrl: tournament.rightPhotoUrl,
				photoURL: tournament.photoURL,
				city: tournament.city,
				title: tournament.title,
				qrUrl: "",
				isPayment: false
			)
			let userID = self.userIdService.get()
			getRequestsFirebaseService.postTicket(
				ticket: ticket,
				userID: userID,
				completion: { ticket in
					print(ticket)
				})
			let roboKassaVC = roboKassaFeature.run(with: "200", isTest: false)
			presentRoboKassaPayment(with: roboKassaVC)
		} else {
			warningService.present(
				with: .custom("Покупка билета невозможна".H316(color: .white)),
				dismiss: true
			)
		}
    }
	
	private func presentRoboKassaPayment(with viewController: UIViewController){
		self.routerService.present(
			with: .viewController(viewController),
			animation: true,
			transitionStyle: .coverVertical,
			presentationStyle: .formSheet
		)
	}
}
