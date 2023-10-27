//
//  PostCollectionCellBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import UIKit
import Architecture

final class PostCollectionCellBuilder: BuilderProtocol {
    
    typealias V  = PostCollectionCell
    typealias VM = PostCollectionCellViewManager
    
    public var view       : PostCollectionCell
    public var viewManager: PostCollectionCellViewManager
    
    public static func build(
        with collection: UICollectionView,
        with indexPath: IndexPath
    ) -> PostCollectionCellBuilder {
        let cell = PostCollectionCell.createForXib(
            with: collection,
            with: indexPath
        )
        let viewManager = PostCollectionCellViewManager()
        viewManager.bind(with: cell)
        let selfBuilder = PostCollectionCellBuilder(
            with: cell,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with cell: PostCollectionCell,
        with viewManager: PostCollectionCellViewManager
    ) {
        self.view        = cell
        self.viewManager = viewManager
    }
}

