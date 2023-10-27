//
//  TournamentsScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Architecture

final class TournamentsScreenViewManager: ViewManager<TournamentsScreenViewController> {
    
    // MARK: - DI
    private let tournamentsFeature: TournamentsFeature
    
    init(
        tournamentsFeature: TournamentsFeature
    ) {
        self.tournamentsFeature = tournamentsFeature
    }
    
    var viewProperties: TournamentsScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    private var tournamentsCollectionViewManager: TournamentsCollectionViewManager?
    
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
                viewProperties = TournamentsScreenViewController.ViewProperties(
                    addCollectionView: addAndCreateTournamentsCollectionView,
                    viewDidAppear: viewDidAppear
                )
                create?(viewProperties)
                subscribeUpdateTournamentsFeature()
        }
    }
    
    private func addAndCreateTournamentsCollectionView(with containerView: UIView) {
        let tournamentsCollectionViewBuilder = TournamentsCollectionViewBuilder.build()
        let tournamentsCollectionView = tournamentsCollectionViewBuilder.view
        containerView.addSubview(tournamentsCollectionView)
        tournamentsCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.tournamentsCollectionViewManager = tournamentsCollectionViewBuilder.viewManager
    }
    
    private func viewDidAppear(){
        
    }
    
    private func subscribeUpdateTournamentsFeature() {
        tournamentsFeature.getTournaments()
        tournamentsFeature.observeForUpdate { [weak self] feature in
            guard let self = self else { return }
            let tournaments = feature.tournaments
			self.tournamentsCollectionViewManager?.state = .createViewProperties(tournaments, .vertical)
        }
    }
}
