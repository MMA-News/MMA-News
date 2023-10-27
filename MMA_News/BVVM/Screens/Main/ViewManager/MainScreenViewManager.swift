//
//  MainScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import UIKit
import Architecture

final class MainScreenViewManager: ViewManager<MainScreenViewController> {
    
    var viewProperties: MainScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    private var mainCollectionViewManager: MainCollectionViewManager?
    
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
                viewProperties = MainScreenViewController.ViewProperties(
                    addCollectionView: addAndCreateMainCollectionView
                )
                create?(viewProperties)
        }
    }
    
    private func addAndCreateMainCollectionView(with containerView: UIView) {
        let homeCollectionViewBuilder = MainCollectionViewBuilder.build()
        let homeCollectionView = homeCollectionViewBuilder.view
        containerView.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.mainCollectionViewManager = homeCollectionViewBuilder.viewManager
        self.mainCollectionViewManager?.state = .createViewProperties
    }
}
