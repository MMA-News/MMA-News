//
//  FightPairsCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import Foundation
import Architecture

final class FightPairsCollectionCellViewManager:  ViewManager<FightPairsCollectionCell> {
    
    // MARK: - DI
    private let tournamentsDetailFeature: TournamentsDetailFeature
    
    init(
        tournamentsDetailFeature: TournamentsDetailFeature
    ) {
        self.tournamentsDetailFeature = tournamentsDetailFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: FightPairsCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(DECPair)
        case updateViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let pair):
                viewProperties = FightPairsCollectionCell.ViewProperties(
                    pair: pair,
                    leftPairOfFighter: nil,
                    rightPairOfFighter: nil
                )
                create?(viewProperties)
                subscribeUpdateTournamentsDetailFeature(with: pair)
                
            case .updateViewProperties:
                self.update?(viewProperties)
        }
    }
    
    private func subscribeUpdateTournamentsDetailFeature(with pair: DECPair) {
        self.tournamentsDetailFeature.getPairOfFighters(with: pair.left) { pairOfFighter in
            self.viewProperties?.leftPairOfFighter = pairOfFighter
            self.state = .updateViewProperties
        }
        self.tournamentsDetailFeature.getPairOfFighters(with: pair.right) { pairOfFighter in
            self.viewProperties?.rightPairOfFighter = pairOfFighter
            self.state = .updateViewProperties
        }
    }
}
