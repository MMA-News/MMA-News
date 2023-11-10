//
//  TicketCollectionDelegate.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import UIKit
import Resolver

final class TicketCollectionDelegate: NSObject, UICollectionViewDelegate {
   
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension TicketCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
		let halfPadding = DesignSystem.Guid.horizontalPadding / 2
		let result = halfPadding + DesignSystem.Guid.horizontalPadding
		let width : CGFloat = (collectionView.bounds.width / 2) - result
		let height: CGFloat = 260
		return .init(width: width, height: height)
    }
}
