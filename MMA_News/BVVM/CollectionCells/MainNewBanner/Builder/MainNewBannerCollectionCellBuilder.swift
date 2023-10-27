//
//  MainNewBannerCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture
import Resolver

final class MainNewBannerCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = MainNewBannerCollectionCell
    typealias VM = MainNewBannerCollectionCellViewManager
    
    public var view       : MainNewBannerCollectionCell
    public var viewManager: MainNewBannerCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> MainNewBannerCollectionCellBuilder {
        let cell = MainNewBannerCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = MainNewBannerCollectionCellViewManager(
            mainFeature: Resolver.resolve()
        )
        viewManager.bind(with: cell)
        let selfBuilder = MainNewBannerCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: MainNewBannerCollectionCell,
        with viewManager: MainNewBannerCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

