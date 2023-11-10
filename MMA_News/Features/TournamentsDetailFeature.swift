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
    
    init(
        getRequestsFirebaseService: GetRequestsFirebaseService,
        routerService: RouterService,
        warningService: WarningService,
		roboKassaFeature: RoboKassaFeature
    ) {
        self.getRequestsFirebaseService = getRequestsFirebaseService
        self.routerService = routerService
        self.warningService = warningService
		self.roboKassaFeature = roboKassaFeature
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
    
    func didTapBuyTicket() {
		if true {
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
