//
//  NavBarViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Router
import Foundation
import Architecture

final class NavBarViewManager: ViewManager<NavBarView> {
    
    // MARK: - DI
    private let navBarFeature: NavBarFeature
    private let routerService: RouterService
    
    init(
        navBarFeature: NavBarFeature,
        routerService: RouterService
    ) {
        self.navBarFeature = navBarFeature
        self.routerService = routerService
    }
    
    var viewProperties: NavBarView.ViewProperties?
    
    //MARK: - Main state view Manager
    enum State {
        case createViewProperties
        case update
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = NavBarView.ViewProperties(
                    isHiddenButton: navBarFeature.isHiddenButton,
                    didTapBack: didTapBack
                )
                create?(viewProperties)
                subscribeUpdate()
                
            case .update:
                update?(viewProperties)
        }
    }
    
    private func didTapBack(){
        navBarFeature.hiddenBackButton(isHidden: true)
        routerService.popMainNavigation(animated: true)
    }
    
    private func subscribeUpdate() {
        self.navBarFeature.observeForUpdate { navBarFeature in
            self.viewProperties?.isHiddenButton = navBarFeature.isHiddenButton
            self.state = .update
        }
    }
}
