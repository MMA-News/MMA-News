//
//  NewsCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Resolver
import Architecture
import UIKit

final class NewsCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = NewsCollectionView
    typealias VM = NewsCollectionViewManager
    
    public var view       : NewsCollectionView
    public var viewManager: NewsCollectionViewManager
    
    public static func build() -> NewsCollectionViewBuilder {
        let view        = NewsCollectionView.loadNib()
        let viewManager = NewsCollectionViewManager(
            newsFeature: Resolver.resolve()
        )
        viewManager.bind(with: view)
        let selfBuilder = NewsCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: NewsCollectionView,
        with viewManager: NewsCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

