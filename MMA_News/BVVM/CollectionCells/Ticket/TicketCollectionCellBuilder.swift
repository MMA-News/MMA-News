//
//  TicketCollectionCellBuilder.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import UIKit
import Architecture

final class TicketCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = TicketCollectionCell
    typealias VM = TicketCollectionCellViewManager
    
    public var view       : TicketCollectionCell
    public var viewManager: TicketCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> TicketCollectionCellBuilder {
        let cell = TicketCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = TicketCollectionCellViewManager()
        viewManager.bind(with: cell)
        let selfBuilder = TicketCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: TicketCollectionCell,
        with viewManager: TicketCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

