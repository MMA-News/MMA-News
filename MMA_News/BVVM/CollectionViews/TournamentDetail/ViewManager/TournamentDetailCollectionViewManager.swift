//
//  TournamentDetailCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import Resolver
import Architecture
import UIKit

final class TournamentDetailCollectionViewManager: ViewManager<TournamentDetailCollectionView> {
    
    //MARK: - implementation protocol
    var viewProperties: TournamentDetailCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(DECTournament)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let tournament):
                var sections: [TournamentDetailCollection] = []
                sections.append(.media(tournament))
                sections.append(.main(tournament))
                if let pairs = tournament.pairs {
                    sections.append(.pairs(pairs))
                }
                sections.append(.post(tournament))
               

                viewProperties = TournamentDetailCollectionView.ViewProperties(
                    sections: sections
                )
                create?(viewProperties)
        }
    }
}
