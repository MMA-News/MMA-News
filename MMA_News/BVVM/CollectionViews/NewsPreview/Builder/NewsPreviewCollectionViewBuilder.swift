//
//  NewsPreviewCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import Resolver
import Architecture
import UIKit

final class NewsPreviewCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = NewsPreviewCollectionView
    typealias VM = NewsPreviewCollectionViewManager
    
    public var view       : NewsPreviewCollectionView
    public var viewManager: NewsPreviewCollectionViewManager
    
    public static func build() -> NewsPreviewCollectionViewBuilder {
        let view        = NewsPreviewCollectionView.loadNib()
        let viewManager = NewsPreviewCollectionViewManager(
            newsFeature: Resolver.resolve()
        )
        viewManager.bind(with: view)
        let selfBuilder = NewsPreviewCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: NewsPreviewCollectionView,
        with viewManager: NewsPreviewCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

