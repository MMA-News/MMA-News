//
//  FightPairsCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Resolver
import Architecture

final class FightPairsCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = FightPairsCollectionCell
    typealias VM = FightPairsCollectionCellViewManager
    
    public var view       : FightPairsCollectionCell
    public var viewManager: FightPairsCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> FightPairsCollectionCellBuilder {
        let cell = FightPairsCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = FightPairsCollectionCellViewManager(
            tournamentsDetailFeature: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = FightPairsCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: FightPairsCollectionCell,
        with viewManager: FightPairsCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

