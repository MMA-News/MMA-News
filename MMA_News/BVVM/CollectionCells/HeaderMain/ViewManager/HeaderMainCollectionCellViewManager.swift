//
//  HeaderMainCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import Foundation
import Router
import Architecture

final class HeaderMainCollectionCellViewManager:  ViewManager<HeaderMainCollectionCell> {
    
    // MARK: - DI
    private let routerService: RouterService
    
    init(
        routerService: RouterService
    ) {
        self.routerService = routerService
    }
    
    //MARK: - implementation protocol
    var viewProperties: HeaderMainCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(HeaderMainCollectionType)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let headerMainCollectionType):
                viewProperties = HeaderMainCollectionCell.ViewProperties(
                    headerMainCollectionType: headerMainCollectionType,
                    didTapMore: didTapMore
                )
                create?(viewProperties)
        }
    }
    
    private func didTapMore(with headerMainCollectionType: HeaderMainCollectionType){
        switch headerMainCollectionType {
            case .news:
                routerService.switchTabBar(with: 1)
            case .media:
                routerService.switchTabBar(with: 3)
            case .fighters:
                routerService.switchTabBar(with: 2)
			case .tournaments:
				routerService.switchTabBar(with: 3)
        }
    }
}
