//
//  NewsCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Resolver

final class NewsCollectionDataSources: NSObject {
   
    private var viewProperties: NewsCollectionView.ViewProperties?
    
    public func update(with viewProperties: NewsCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension NewsCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.news.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = NewsCollectionCellBuilder.build(
            with: collectionView,
            with: indexPath
        )
        let news = self.viewProperties!.news[indexPath.row]
        collectionCellBuilder.viewManager.state = .createViewProperties(news, indexPath)
        return collectionCellBuilder.view
    }
}

