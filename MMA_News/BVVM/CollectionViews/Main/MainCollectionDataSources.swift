//
//  MainCollectionDataSources.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import UIKit
import Resolver

final class MainCollectionDataSources: NSObject {
    
    // MARK: - DI
    private let mainCollectionCellFactory: MainCollectionCellFactory
    
    init(
        mainCollectionCellFactory: MainCollectionCellFactory
    ) {
        self.mainCollectionCellFactory = mainCollectionCellFactory
    }
    
    private var viewProperties: MainCollectionView.ViewProperties?
    
    public func update(with viewProperties: MainCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension MainCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.row ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewProperties?.section ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionCellFactory.build(
            with: collectionView,
            with: indexPath
        )
        return cell
    }
}

