//
//  FightersCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Resolver
import Architecture
import UIKit

final class FightersCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = FightersCollectionView
    typealias VM = FightersCollectionViewManager
    
    public var view       : FightersCollectionView
    public var viewManager: FightersCollectionViewManager
    
    public static func build() -> FightersCollectionViewBuilder {
        let view        = FightersCollectionView.loadNib()
        let viewManager = FightersCollectionViewManager(
            fightersFeature: Resolver.resolve()
        )
        viewManager.bind(with: view)
        let selfBuilder = FightersCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: FightersCollectionView,
        with viewManager: FightersCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

