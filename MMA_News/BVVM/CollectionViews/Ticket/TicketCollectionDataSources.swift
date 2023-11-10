//
//  TicketCollectionDataSources.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import UIKit
import Resolver

final class TicketCollectionDataSources: NSObject {
    
    private var viewProperties: TicketCollectionView.ViewProperties?
    
    public func update(with viewProperties: TicketCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - DataSource CollectionView
extension TicketCollectionDataSources: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.viewProperties?.tickets.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCellBuilder = TicketCollectionCellBuilder.build(
            with: collectionView,
            with: indexPath
        )
		let ticket = viewProperties!.tickets[indexPath.row]
        collectionCellBuilder.viewManager.state = .createViewProperties(ticket)
        return collectionCellBuilder.view
    }
}

