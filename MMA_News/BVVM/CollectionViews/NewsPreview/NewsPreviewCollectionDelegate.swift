//
//  NewsPreviewCollectionDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import UIKit
import Resolver

final class NewsPreviewCollectionDelegate: NSObject, UICollectionViewDelegate {
   
    private var viewProperties: NewsPreviewCollectionView.ViewProperties?
    
    public func update(with viewProperties: NewsPreviewCollectionView.ViewProperties?) {
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
extension NewsPreviewCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width : CGFloat = collectionView.bounds.height
        let height: CGFloat = collectionView.bounds.height
        return .init(width: width, height: height)
    }
}
