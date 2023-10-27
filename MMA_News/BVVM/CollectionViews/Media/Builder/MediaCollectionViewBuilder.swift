//
//  MediaCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import Resolver
import Architecture
import UIKit

final class MediaCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = MediaCollectionView
    typealias VM = MediaCollectionViewManager
    
    public var view       : MediaCollectionView
    public var viewManager: MediaCollectionViewManager
    
    public static func build() -> MediaCollectionViewBuilder {
        let view        = MediaCollectionView.loadNib()
        let viewManager = MediaCollectionViewManager()
        viewManager.bind(with: view)
        let selfBuilder = MediaCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: MediaCollectionView,
        with viewManager: MediaCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

