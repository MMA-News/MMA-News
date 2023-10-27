//
//  FightersCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Foundation
import Architecture

final class FightersCollectionCellViewManager:  ViewManager<FightersCollectionCell> {
    
    //MARK: - implementation protocol
    var viewProperties: FightersCollectionCell.ViewProperties?
    
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
                viewProperties = FightersCollectionCell.ViewProperties()
                create?(viewProperties)
        }
    }
}
