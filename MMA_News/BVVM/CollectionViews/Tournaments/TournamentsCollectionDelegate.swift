//
//  TournamentsCollectionDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Resolver

final class TournamentsCollectionDelegate: NSObject, UICollectionViewDelegate {
    
    private var viewProperties: TournamentsCollectionView.ViewProperties?
    
    public func update(
        with viewProperties: TournamentsCollectionView.ViewProperties?
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
extension TournamentsCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let halfPadding = DesignSystem.Guid.horizontalPadding / 2
        let result = halfPadding + DesignSystem.Guid.horizontalPadding
        let width : CGFloat = (collectionView.bounds.width / 2) - result
        let height: CGFloat = 280
        return .init(width: width, height: height)
    }
}
