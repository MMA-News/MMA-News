//
//  MainCollectionView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import UIKit
import Resolver
import Architecture

final class MainCollectionView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let row: Int
        let section: Int
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionDelegate: MainCollectionDelegate = Resolver.resolve()
    private let collectionDataSources: MainCollectionDataSources = Resolver.resolve()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        collectionDataSources.update(with: self.viewProperties)
        collectionDelegate.update(with: self.viewProperties)
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        let collectionViewLayout = MainCollectionViewLayout()
        collectionViewLayout.sectionInset  = .init(
            top: 0,
            left: DesignSystem.Guid.horizontalPadding,
            bottom: 0,
            right: DesignSystem.Guid.horizontalPadding
        )
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = 0
        collectionViewLayout.minimumInteritemSpacing       = 0
        collectionViewLayout.scrollDirection               = .vertical
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collectionDelegate
        self.collectionView.dataSource                     = self.collectionDataSources
        self.collectionView.reloadData()
    }
}
