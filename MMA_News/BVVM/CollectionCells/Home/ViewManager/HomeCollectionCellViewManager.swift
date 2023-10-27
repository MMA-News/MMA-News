//
//  HomeCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Foundation
import Router
import Architecture

final class HomeCollectionCellViewManager:  ViewManager<HomeCollectionCell> {
    
    //MARK: - implementation protocol
    var viewProperties: HomeCollectionCell.ViewProperties?
    
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
                viewProperties = HomeCollectionCell.ViewProperties()
                create?(viewProperties)
        }
    }
}
