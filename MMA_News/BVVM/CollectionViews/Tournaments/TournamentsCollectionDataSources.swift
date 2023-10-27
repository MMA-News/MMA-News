//
//  TournamentsCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Resolver

final class TournamentsCollectionDataSources: NSObject {
    
    private var viewProperties: TournamentsCollectionView.ViewProperties?
    
    public func update(
        with viewProperties: TournamentsCollectionView.ViewProperties?
    ) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension TournamentsCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.tournaments.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = TournamentsCollectionCellBuilder.build(
            with: collectionView,
            with: indexPath
        )
        let tournament = self.viewProperties!.tournaments[indexPath.row]
        collectionCellBuilder.viewManager.state = .createViewProperties(tournament, indexPath)
        return collectionCellBuilder.view
    }
}

