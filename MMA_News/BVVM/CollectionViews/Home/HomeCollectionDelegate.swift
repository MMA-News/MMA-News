//
//  HomeCollectionDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Resolver

final class HomeCollectionDelegate: NSObject, UICollectionViewDelegate {
   
    private var viewProperties: HomeCollectionView.ViewProperties?
    
    public func update(
        with viewProperties: HomeCollectionView.ViewProperties?
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
extension HomeCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width : CGFloat = collectionView.bounds.width
        let height: CGFloat = 100
        return .init(width: width, height: height)
    }
}
