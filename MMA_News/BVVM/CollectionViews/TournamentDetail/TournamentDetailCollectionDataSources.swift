//
//  TournamentDetailCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Resolver

final class TournamentDetailCollectionDataSources: NSObject {
    
    private var viewProperties: TournamentDetailCollectionView.ViewProperties?
    
    public func update(with viewProperties: TournamentDetailCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension TournamentDetailCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = viewProperties?.sections[section]
        return section?.rows() ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewProperties?.sections.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = viewProperties!.sections[indexPath.section]
        let cell = section.cell(
            collectionView: collectionView,
            indexPath: indexPath
        )
        return cell
    }
}
