//
//  HomeCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Resolver
import Router
import Architecture
import UIKit

final class HomeCollectionViewManager: ViewManager<HomeCollectionView> {
    
    // MARK: - DI
    private let routerService: RouterService
    private let navBarFeature: NavBarFeature
    
    init(
        routerService: RouterService,
        navBarFeature: NavBarFeature
    ) {
        self.routerService = routerService
        self.navBarFeature = navBarFeature
    }
    
    
    //MARK: - implementation protocol
    var viewProperties: HomeCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = HomeCollectionView.ViewProperties(
                    cellsCount: 5,
                    didTapCell: didTapCell
                )
                create?(viewProperties)
        }
    }
    
    private func didTapCell(with indexPath: IndexPath){
        let builder = WebContentScreenViewControllerBuilder.build()
        navBarFeature.hiddenBackButton(isHidden: false)
        builder.viewManager.state = .createViewProperties
        routerService.pushMainNavigation(
            to: builder.view,
            animated: true
        )
    }
}
