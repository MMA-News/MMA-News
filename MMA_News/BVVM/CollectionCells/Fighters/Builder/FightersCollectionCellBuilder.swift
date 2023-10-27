//
//  FightersCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Resolver
import Architecture

final class FightersCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = FightersCollectionCell
    typealias VM = FightersCollectionCellViewManager
    
    public var view       : FightersCollectionCell
    public var viewManager: FightersCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> FightersCollectionCellBuilder {
        let cell = FightersCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = FightersCollectionCellViewManager()
        viewManager.bind(with: cell)
        let selfBuilder = FightersCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: FightersCollectionCell,
        with viewManager: FightersCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

