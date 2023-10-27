//
//  HomeScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import UIKit
import Architecture

final class HomeScreenViewManager: ViewManager<HomeScreenViewController> {
    
    var viewProperties: HomeScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    private var homeCollectionViewManager: HomeCollectionViewManager?
    
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
                viewProperties = HomeScreenViewController.ViewProperties(
                    addCollectionView: addAndCreateHomeCollectionView
                )
                create?(viewProperties)
        }
    }
    
    private func addAndCreateHomeCollectionView(with containerView: UIView) {
        let homeCollectionViewBuilder = HomeCollectionViewBuilder.build()
        let homeCollectionView = homeCollectionViewBuilder.view
        containerView.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.homeCollectionViewManager = homeCollectionViewBuilder.viewManager
        self.homeCollectionViewManager?.state = .createViewProperties
    }
}
