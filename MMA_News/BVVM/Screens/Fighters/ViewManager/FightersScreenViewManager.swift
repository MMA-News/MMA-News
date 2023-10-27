//
//  FightersScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import UIKit
import SnapKit
import Architecture

final class FightersScreenViewManager: ViewManager<FightersScreenViewController> {
    
    // MARK: - DI
    private let fightersFeature: FightersFeature
    
    init(
        fightersFeature: FightersFeature
    ) {
        self.fightersFeature = fightersFeature
    }
    
    var viewProperties: FightersScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    private var fightersCollectionViewManager: FightersCollectionViewManager?
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = FightersScreenViewController.ViewProperties(
                    addCollectionView: addAndCreateFightersCollectionView
                )
                create?(viewProperties)
                subscribeUpdateFightersFeature()
        }
    }
    
    private func subscribeUpdateFightersFeature() {
        fightersFeature.getFighters()
        self.fightersFeature.observeForUpdate { [weak self] feature in
            guard let self = self else { return }
            let fighters = feature.fighters
            self.fightersCollectionViewManager?.state = .createViewProperties(fighters, .vertical)
        }
    }
    
    private func addAndCreateFightersCollectionView(with containerView: UIView) {
        let fightersCollectionViewBuilder = FightersCollectionViewBuilder.build()
        let fightersCollectionView = fightersCollectionViewBuilder.view
        containerView.addSubview(fightersCollectionView)
        fightersCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.fightersCollectionViewManager = fightersCollectionViewBuilder.viewManager
    }
}
