//
//  NewsPreviewCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import UIKit
import Resolver

final class NewsPreviewCollectionDataSources: NSObject {
    
    private var viewProperties: NewsPreviewCollectionView.ViewProperties?
    
    public func update(with viewProperties: NewsPreviewCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension NewsPreviewCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.news.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = NewsPreviewCollectionCellBuilder.build(
            with: collectionView,
            with: indexPath
        )
        let news = self.viewProperties!.news[indexPath.row]
        collectionCellBuilder.viewManager.state = .createViewProperties(news, indexPath)
        return collectionCellBuilder.view
    }
}

