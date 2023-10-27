//
//  MediaCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Resolver

final class MediaCollectionDataSources: NSObject {
    
    private var viewProperties: MediaCollectionView.ViewProperties?
    
    public func update(with viewProperties: MediaCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension MediaCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.medias.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = MediaCollectionCellBuilder.build(
            with: collectionView,
            with: indexPath
        )
        let media = viewProperties!.medias[indexPath.row]
        collectionCellBuilder.viewManager.state = .createViewProperties(media)
        return collectionCellBuilder.view
    }
}

