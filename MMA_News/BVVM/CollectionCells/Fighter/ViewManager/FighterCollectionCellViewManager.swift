//
//  FighterCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 14.02.2023.
//
import Foundation
import Architecture

final class FighterCollectionCellViewManager:  ViewManager<FighterCollectionCell> {
    
    //MARK: - implementation protocol
    var viewProperties: FighterCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(DECFighter)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let fighter):
               viewProperties = FighterCollectionCell.ViewProperties(
                fighter: fighter
               )
                create?(viewProperties)
        }
    }
}
