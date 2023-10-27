//
//  HomeCollectionView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Architecture

final class HomeCollectionView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let cellsCount: Int
        let didTapCell: Closure<IndexPath>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionDelegate = HomeCollectionDelegate()
    private let collectionDataSources = HomeCollectionDataSources()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setupCollectionView()
        collectionDataSources.update(with: self.viewProperties)
        collectionDelegate.update(with: self.viewProperties)
    }
    
    private func setupCollectionView() {
        let collectionViewLayout                           = HomeCollectionViewLayout()
        collectionViewLayout.sectionInset                  = .init(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = 1
        collectionViewLayout.minimumInteritemSpacing       = 0
        collectionViewLayout.scrollDirection               = .vertical
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collectionDelegate
        self.collectionView.dataSource                     = self.collectionDataSources
        self.collectionView.reloadData()
    }
}
