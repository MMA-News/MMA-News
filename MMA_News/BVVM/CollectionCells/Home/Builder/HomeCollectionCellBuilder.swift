//
//  HomeCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Architecture

final class HomeCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = HomeCollectionCell
    typealias VM = HomeCollectionCellViewManager
    
    public var view       : HomeCollectionCell
    public var viewManager: HomeCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> HomeCollectionCellBuilder {
        let cell = HomeCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = HomeCollectionCellViewManager()
        viewManager.bind(with: cell)
        let selfBuilder = HomeCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: HomeCollectionCell,
        with viewManager: HomeCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

