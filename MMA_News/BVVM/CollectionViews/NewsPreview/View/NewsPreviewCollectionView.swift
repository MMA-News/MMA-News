//
//  NewsPreviewCollectionView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import UIKit
import Architecture

final class NewsPreviewCollectionView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let news: [DECNew]
        let didTapCell: Closure<IndexPath>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionDelegate = NewsPreviewCollectionDelegate()
    private let collectionDataSources = NewsPreviewCollectionDataSources()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        collectionDataSources.update(with: viewProperties)
        collectionDelegate.update(with: viewProperties)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let collectionViewLayout = NewsPreviewCollectionViewLayout()
        collectionViewLayout.sectionInset = .init(
            top: 0,
            left: DesignSystem.Guid.horizontalPadding,
            bottom: 0,
            right: DesignSystem.Guid.horizontalPadding
        )
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = DesignSystem.Guid.horizontalPadding
        collectionViewLayout.scrollDirection               = .horizontal
        self.collectionView.backgroundColor                = DesignSystem.Color.background
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collectionDelegate
        self.collectionView.dataSource                     = self.collectionDataSources
        self.collectionView.reloadData()
    }
}
