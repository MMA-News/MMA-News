//
//  MainCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import Resolver
import Architecture
import UIKit

final class MainCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = MainCollectionView
    typealias VM = MainCollectionViewManager
    
    public var view       : MainCollectionView
    public var viewManager: MainCollectionViewManager
    
    public static func build() -> MainCollectionViewBuilder {
        let view        = MainCollectionView.loadNib()
        let viewManager = MainCollectionViewManager(
            mainCollectionCellFactory: Resolver.resolve()
        )
        viewManager.bind(with: view)
        let selfBuilder = MainCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: MainCollectionView,
        with viewManager: MainCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

