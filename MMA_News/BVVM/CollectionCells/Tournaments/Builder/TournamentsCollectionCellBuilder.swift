//
//  TournamentsCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Resolver
import Architecture

final class TournamentsCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = TournamentsCollectionCell
    typealias VM = TournamentsCollectionCellViewManager
    
    public var view       : TournamentsCollectionCell
    public var viewManager: TournamentsCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> TournamentsCollectionCellBuilder {
        let cell = TournamentsCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = TournamentsCollectionCellViewManager(
            tournamentsFeature: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = TournamentsCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: TournamentsCollectionCell,
        with viewManager: TournamentsCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

