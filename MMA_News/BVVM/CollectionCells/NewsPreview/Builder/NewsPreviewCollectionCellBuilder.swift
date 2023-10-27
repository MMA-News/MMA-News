//
//  NewsPreviewCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import UIKit
import Architecture
import Resolver

final class NewsPreviewCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = NewsPreviewCollectionCell
    typealias VM = NewsPreviewCollectionCellViewManager
    
    public var view       : NewsPreviewCollectionCell
    public var viewManager: NewsPreviewCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> NewsPreviewCollectionCellBuilder {
        let cell = NewsPreviewCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = NewsPreviewCollectionCellViewManager(
            newsFeature: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = NewsPreviewCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: NewsPreviewCollectionCell,
        with viewManager: NewsPreviewCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

