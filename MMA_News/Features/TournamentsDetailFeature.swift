//
//  TournamentsDetailFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import Router
import FirestoreSDK
import Foundation

final class TournamentsDetailFeature: BaseFeatureService<TournamentsDetailFeature> {
    
    // MARK: - DI
    private let getRequestsFirebaseService: GetRequestsFirebaseService
    private let routerService: RouterService
    private let warningService: WarningService
    
    init(
        getRequestsFirebaseService: GetRequestsFirebaseService,
        routerService: RouterService,
        warningService: WarningService
    ) {
        self.getRequestsFirebaseService = getRequestsFirebaseService
        self.routerService = routerService
        self.warningService = warningService
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
        warningService.present(
            with: .custom("Покупка билета невозможна".H316(color: .white)),
            dismiss: true
        )
    }
}
