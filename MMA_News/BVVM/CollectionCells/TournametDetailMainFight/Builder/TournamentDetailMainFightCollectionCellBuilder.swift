//
//  TournamentDetailMainFightCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Architecture
import Resolver

final class TournamentDetailMainFightCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = TournamentDetailMainFightCollectionCell
    typealias VM = TournamentDetailMainFightCollectionCellViewManager
    
    public var view       : TournamentDetailMainFightCollectionCell
    public var viewManager: TournamentDetailMainFightCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> TournamentDetailMainFightCollectionCellBuilder {
        let cell = TournamentDetailMainFightCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = TournamentDetailMainFightCollectionCellViewManager(
            tournamentsDetailFeature: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = TournamentDetailMainFightCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: TournamentDetailMainFightCollectionCell,
        with viewManager: TournamentDetailMainFightCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

