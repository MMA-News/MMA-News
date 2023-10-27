//
//  TournamentDetailCollectionView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Architecture

final class TournamentDetailCollectionView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let sections: [TournamentDetailCollection]
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionDelegate = TournamentDetailCollectionDelegate()
    private let collectionDataSources = TournamentDetailCollectionDataSources()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setupCollectionView()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        collectionDataSources.update(with: viewProperties)
        collectionDelegate.update(with: viewProperties)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let collectionViewLayout                           = TournamentDetailCollectionViewLayout()
        collectionViewLayout.sectionInset                  = .init(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.sectionInsetReference         = .fromContentInset
        collectionViewLayout.minimumLineSpacing            = 8
        collectionViewLayout.minimumInteritemSpacing       = 8
        collectionViewLayout.scrollDirection               = .vertical
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout           = collectionViewLayout
        self.collectionView.delegate                       = self.collectionDelegate
        self.collectionView.dataSource                     = self.collectionDataSources
        self.collectionView.reloadData()
    }
}
