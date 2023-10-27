//
//  FightersCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Router
import Resolver
import Architecture
import UIKit

final class FightersCollectionViewManager: ViewManager<FightersCollectionView> {
    
    // MARK: - DI
    private let fightersFeature: FightersFeature
  
    init(
        fightersFeature: FightersFeature
    ) {
        self.fightersFeature = fightersFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: FightersCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties([DECFighter], UICollectionView.ScrollDirection)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let fighters, let scrollDirection):
                viewProperties = FightersCollectionView.ViewProperties(
                    fighters: fighters,
                    didTapCell: fightersFeature.didTapCell(with:),
                    scrollDirection: scrollDirection
                )
                create?(viewProperties)
        }
    }
}
