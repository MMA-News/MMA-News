//
//  MediaCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import Resolver
import Architecture
import UIKit

final class MediaCollectionViewManager: ViewManager<MediaCollectionView> {
    
    //MARK: - implementation protocol
    var viewProperties: MediaCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties([DECMedia])
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let medias):
                viewProperties = MediaCollectionView.ViewProperties(
                    medias: medias
                )
                create?(viewProperties)
        }
    }
}
