//
//  HomeCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Resolver

final class HomeCollectionDataSources: NSObject {
    
    private var viewProperties: HomeCollectionView.ViewProperties?
    
    public func update(with viewProperties: HomeCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension HomeCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.cellsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = HomeCollectionCellBuilder.build(
            with: collectionView,
            with: indexPath
        )
        collectionCellBuilder.viewManager.state = .createViewProperties
        return collectionCellBuilder.view
    }
}

