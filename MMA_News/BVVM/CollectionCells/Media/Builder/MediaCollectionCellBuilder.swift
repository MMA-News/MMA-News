//
//  MediaCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture
import Router
import Resolver

final class MediaCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = MediaCollectionCell
    typealias VM = MediaCollectionCellViewManager
    
    public var view       : MediaCollectionCell
    public var viewManager: MediaCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> MediaCollectionCellBuilder {
        let cell = MediaCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = MediaCollectionCellViewManager(
            routerService: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = MediaCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: MediaCollectionCell,
        with viewManager: MediaCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

