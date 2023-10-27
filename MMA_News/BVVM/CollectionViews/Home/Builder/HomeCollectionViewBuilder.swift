//
//  HomeCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Resolver
import Architecture
import UIKit

final class HomeCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = HomeCollectionView
    typealias VM = HomeCollectionViewManager
    
    public var view       : HomeCollectionView
    public var viewManager: HomeCollectionViewManager
    
    public static func build() -> HomeCollectionViewBuilder {
        let view        = HomeCollectionView.loadNib()
        let viewManager = HomeCollectionViewManager(
            routerService: Resolver.resolve(),
            navBarFeature: Resolver.resolve()
        )
        viewManager.bind(with: view)
        let selfBuilder = HomeCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: HomeCollectionView,
        with viewManager: HomeCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

