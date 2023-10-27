//
//  TournamentsCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Foundation
import Architecture

final class TournamentsCollectionCellViewManager:  ViewManager<TournamentsCollectionCell> {
    
    // MARK: - DI
    private let tournamentsFeature: TournamentsFeature
    
    init(
        tournamentsFeature: TournamentsFeature
    ) {
        self.tournamentsFeature = tournamentsFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: TournamentsCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(DECTournament, IndexPath)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let tournament, let indexPath):
                viewProperties = TournamentsCollectionCell.ViewProperties(
                    tournament: tournament,
                    didTabBuy: { 
                        self.tournamentsFeature.didTapBuyTicket(with: indexPath)
                    }
                )
                create?(viewProperties)
        }
    }
}
