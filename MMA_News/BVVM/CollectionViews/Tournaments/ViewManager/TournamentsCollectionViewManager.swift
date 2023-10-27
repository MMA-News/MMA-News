//
//  TournamentsCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Resolver
import Architecture
import UIKit

final class TournamentsCollectionViewManager: ViewManager<TournamentsCollectionView> {
    
    // MARK: - DI
    private let tournamentsFeature: TournamentsFeature
    
    init(
        tournamentsFeature: TournamentsFeature
    ) {
        self.tournamentsFeature = tournamentsFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: TournamentsCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties([DECTournament], UICollectionView.ScrollDirection)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let tournaments, let scrollDirection):
                viewProperties = TournamentsCollectionView.ViewProperties(
                    tournaments: tournaments,
                    didTapCell: self.tournamentsFeature.didTapTournament,
					scrollDirection: scrollDirection
                )
                create?(viewProperties)
        }
    }
}
