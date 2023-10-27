//
//  TournamentsFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 21.02.2023.
//
import Router
import Foundation

final class TournamentsFeature: BaseFeatureService<TournamentsFeature> {
    
    // MARK: - DI
    private let getRequestsFirebaseService: GetRequestsFirebaseService
    private let routerService: RouterService
    private let navBarFeature: NavBarFeature
    private let warningService: WarningService
    
    init(
        getRequestsFirebaseService: GetRequestsFirebaseService,
        routerService: RouterService,
        navBarFeature: NavBarFeature,
        warningService: WarningService
    ) {
        self.getRequestsFirebaseService = getRequestsFirebaseService
        self.routerService = routerService
        self.navBarFeature = navBarFeature
        self.warningService = warningService
    }
    
    // MARK: - public properties
    
    var tournaments: [DECTournament] = []
    
    // MARK: - private methods
    
    
    // MARK: - override methods
    
    override func currentService() -> Self? {
        return self
    }
    
    // MARK: - public methods
    
    func getTournaments(){
        getRequestsFirebaseService.getTournaments { firebaseResult in
            switch firebaseResult {
                case .object(let tournaments):
                guard let tournaments = tournaments else { return }
                    self.tournaments = tournaments
                    self.notifySubscribers()
                case .error(let error):
                    print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func didTapTournament(with indexPath: IndexPath) {
        let tournament = self.tournaments[indexPath.row]
        let builder = TournamentDetailScreenViewControllerBuilder.build()
        navBarFeature.hiddenBackButton(isHidden: false)
        builder.viewManager.state = .createViewProperties(tournament)
        routerService.pushMainNavigation(
            to: builder.view,
            animated: true
        )
    }
    
    func didTapBuyTicket(with indexPath: IndexPath) {
        warningService.present(
            with: .custom("Покупка билета невозможна".H316(color: .white)),
            dismiss: true
        )
    }
}
