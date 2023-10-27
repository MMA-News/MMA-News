//
//  FightersFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 12.02.2023.
//
import Router
import Foundation

final class FightersFeature: BaseFeatureService<FightersFeature> {
    
    // MARK: - DI
    private let getRequestsFirebaseService: GetRequestsFirebaseService
    private let routerService: RouterService
    private let navBarFeature: NavBarFeature
    
    init(
        getRequestsFirebaseService: GetRequestsFirebaseService,
        routerService: RouterService,
        navBarFeature: NavBarFeature
    ) {
        self.getRequestsFirebaseService = getRequestsFirebaseService
        self.routerService = routerService
        self.navBarFeature = navBarFeature
    }
    
    // MARK: - public properties
    
    var fighters: [DECFighter] = []
    
    // MARK: - private methods
    
    
    
    // MARK: - override methods
    
    override func currentService() -> Self? {
        return self
    }
    
    func getFighters(){
        getRequestsFirebaseService.getFighters { firebaseResult in
            switch firebaseResult {
                    
                case .object(let fighters):
                guard let fighters = fighters else { return }
                    self.fighters = fighters
                    self.notifySubscribers()
                case .error(let error):
                    print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func didTapCell(with indexPath: IndexPath){
//        let builder = FighterScreenViewControllerBuilder.build()
//        navBarFeature.hiddenBackButton(isHidden: false)
//        builder.viewManager.state = .createViewProperties
//        routerService.pushMainNavigation(
//            to: builder.view,
//            animated: true
//        )
    }
}
