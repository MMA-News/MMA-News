//
//  MainCollectionDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import UIKit
import Resolver

final class MainCollectionDelegate: NSObject, UICollectionViewDelegate {
    
    // MARK: - DI
    private let mainCollectionCellFactory: MainCollectionCellFactory
    
    init(
        mainCollectionCellFactory: MainCollectionCellFactory
    ) {
        self.mainCollectionCellFactory = mainCollectionCellFactory
    }
    
    private var viewProperties: MainCollectionView.ViewProperties?
    
    public func update(
        with viewProperties: MainCollectionView.ViewProperties?
    ) {
        self.viewProperties = viewProperties
    }
   
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension MainCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let size = mainCollectionCellFactory.size(
            with: collectionView,
            with: indexPath
        )
        return size
    }
}
