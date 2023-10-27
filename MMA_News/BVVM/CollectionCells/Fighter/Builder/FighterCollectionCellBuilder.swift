//
//  FighterCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 14.02.2023.
//
import UIKit
import Architecture

final class FighterCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = FighterCollectionCell
    typealias VM = FighterCollectionCellViewManager
    
    public var view       : FighterCollectionCell
    public var viewManager: FighterCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> FighterCollectionCellBuilder {
        let cell = FighterCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = FighterCollectionCellViewManager()
        viewManager.bind(with: cell)
        let selfBuilder = FighterCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: FighterCollectionCell,
        with viewManager: FighterCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

