//
//  FightersCollectionDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Resolver

final class FightersCollectionDelegate: NSObject, UICollectionViewDelegate {
    
    private var viewProperties: FightersCollectionView.ViewProperties?
    
    public func update(
        with viewProperties: FightersCollectionView.ViewProperties?
    ) {
        self.viewProperties = viewProperties
    }
   
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        self.viewProperties?.didTapCell(indexPath)
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension FightersCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let halfPadding = DesignSystem.Guid.horizontalPadding / 2
        let result = halfPadding + DesignSystem.Guid.horizontalPadding
        let width : CGFloat = (collectionView.bounds.width / 2) - result
        let height: CGFloat = 300
        return .init(width: width, height: height)
    }
}
