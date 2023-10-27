//
//  MainCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import UIKit
import Resolver
import Architecture

final class MainCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = MainCollectionCell
    typealias VM = MainCollectionCellViewManager
    
    public var view       : MainCollectionCell
    public var viewManager: MainCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> MainCollectionCellBuilder {
        let cell = MainCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = MainCollectionCellViewManager(
            mainFeature: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = MainCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: MainCollectionCell,
        with viewManager: MainCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

