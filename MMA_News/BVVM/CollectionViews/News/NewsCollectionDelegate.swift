//
//  NewsCollectionDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Resolver

final class NewsCollectionDelegate: NSObject, UICollectionViewDelegate {
    
    private var viewProperties: NewsCollectionView.ViewProperties?
    
    public func update(with viewProperties: NewsCollectionView.ViewProperties?) {
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
extension NewsCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width : CGFloat = (collectionView.bounds.width - DesignSystem.Guid.horizontalPadding)
        let height: CGFloat = 200
        return .init(width: width, height: height)
    }
}
