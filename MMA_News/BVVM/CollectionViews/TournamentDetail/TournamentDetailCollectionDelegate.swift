//
//  TournamentDetailCollectionDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Resolver

final class TournamentDetailCollectionDelegate: NSObject, UICollectionViewDelegate {
    
    private var viewProperties: TournamentDetailCollectionView.ViewProperties?
    
    public func update(with viewProperties: TournamentDetailCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
   
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension TournamentDetailCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let section = viewProperties!.sections[indexPath.section]
        let width : CGFloat = (collectionView.bounds.width) - DesignSystem.Guid.horizontalPadding
        let height: CGFloat = section.height(indexPath: indexPath)
        return .init(width: width, height: height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        let section = viewProperties!.sections[section]
        return section.insets()
    }
}
