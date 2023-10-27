//
//  HeaderMainCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture
import Resolver

final class HeaderMainCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = HeaderMainCollectionCell
    typealias VM = HeaderMainCollectionCellViewManager
    
    public var view       : HeaderMainCollectionCell
    public var viewManager: HeaderMainCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> HeaderMainCollectionCellBuilder {
        let cell = HeaderMainCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = HeaderMainCollectionCellViewManager(
            routerService: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = HeaderMainCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: HeaderMainCollectionCell,
        with viewManager: HeaderMainCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

