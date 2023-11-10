//
//  MediaCollectionView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class MediaCollectionView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let medias: [DECMedia]
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionDelegate = MediaCollectionDelegate()
    private let collectionDataSources = MediaCollectionDataSources()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        collectionDataSources.update(with: viewProperties)
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        let collectionViewLayout = MediaCollectionViewLayout()
        collectionViewLayout.sectionInset = .init(
            top: 0,
            left: DesignSystem.Guid.horizontalPadding,
            bottom: 0,
            right: DesignSystem.Guid.horizontalPadding
        )
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = DesignSystem.Guid.horizontalPadding
        collectionViewLayout.minimumInteritemSpacing       = 0
        collectionViewLayout.scrollDirection               = .horizontal
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.delegate                       = self.collectionDelegate
        self.collectionView.dataSource                     = self.collectionDataSources
        self.collectionView.reloadData()
        self.collectionView.collectionViewLayout           = collectionViewLayout
    }
}
