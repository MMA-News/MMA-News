//
//  TournamentsCollectionView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Architecture

final class TournamentsCollectionView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let tournaments: [DECTournament]
        let didTapCell: Closure<IndexPath>
		let scrollDirection: UICollectionView.ScrollDirection
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionDelegate = TournamentsCollectionDelegate()
    private let collectionDataSources = TournamentsCollectionDataSources()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setupCollectionView(with: self.viewProperties)
        collectionDataSources.update(with: self.viewProperties)
        collectionDelegate.update(with: self.viewProperties)
    }
    
    private func setupCollectionView(with viewProperties: ViewProperties?) {
        let collectionViewLayout = TournamentsCollectionViewLayout()
        collectionViewLayout.sectionInset  = .init(
            top: DesignSystem.Guid.verticalPadding,
            left: DesignSystem.Guid.horizontalPadding,
            bottom: DesignSystem.Guid.verticalPadding,
            right: DesignSystem.Guid.horizontalPadding
        )
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = DesignSystem.Guid.verticalPadding
        collectionViewLayout.minimumInteritemSpacing       = 0
		collectionViewLayout.scrollDirection               = viewProperties?.scrollDirection ?? .vertical
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collectionDelegate
        self.collectionView.dataSource                     = self.collectionDataSources
        self.collectionView.backgroundColor = DesignSystem.Color.background
        self.collectionView.reloadData()
    }
}
