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
        let width : CGFloat = 0
        let height: CGFloat = 0
        return .init(width: width, height: height)
    }
}
