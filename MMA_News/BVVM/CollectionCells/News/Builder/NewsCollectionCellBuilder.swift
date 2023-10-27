//
//  NewsCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Resolver
import UIKit
import Architecture

final class NewsCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = NewsCollectionCell
    typealias VM = NewsCollectionCellViewManager
    
    public var view       : NewsCollectionCell
    public var viewManager: NewsCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> NewsCollectionCellBuilder {
        let cell = NewsCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = NewsCollectionCellViewManager(
            newsFeature: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = NewsCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: NewsCollectionCell,
        with viewManager: NewsCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

