//
//  MainCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import Resolver
import Architecture
import UIKit

final class MainCollectionViewManager: ViewManager<MainCollectionView> {
    
    // MARK: - DI
    private let mainCollectionCellFactory: MainCollectionCellFactory
    
    init(
        mainCollectionCellFactory: MainCollectionCellFactory
    ) {
        self.mainCollectionCellFactory = mainCollectionCellFactory
    }
    
    //MARK: - implementation protocol
    var viewProperties: MainCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = MainCollectionView.ViewProperties(
                    row: 1,
                    section: mainCollectionCellFactory.sections.count
                )
                create?(viewProperties)
        }
    }
}
