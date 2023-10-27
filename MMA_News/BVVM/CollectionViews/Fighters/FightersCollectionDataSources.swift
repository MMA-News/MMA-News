//
//  FightersCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Resolver

final class FightersCollectionDataSources: NSObject {
    
    private var viewProperties: FightersCollectionView.ViewProperties?
    
    public func update(
        with viewProperties: FightersCollectionView.ViewProperties?
    ) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension FightersCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.fighters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = FighterCollectionCellBuilder.build(
            with: collectionView,
            with: indexPath
        )
        let fighter = self.viewProperties!.fighters[indexPath.row]
        collectionCellBuilder.viewManager.state = .createViewProperties(fighter)
        return collectionCellBuilder.view
    }
}

