//
//  TicketCollectionView.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import UIKit
import Architecture

final class TicketCollectionView: UICollectionView, ViewProtocol {
    
    struct ViewProperties {
        let tickets: [TicketCollectionCell.ViewProperties]
    }
    var viewProperties: ViewProperties?
	
	init() {
		let collectionViewLayout = TicketCollectionViewLayout()
		collectionViewLayout.sectionInset  = .init(
			top: DesignSystem.Guid.verticalPadding,
			left: DesignSystem.Guid.horizontalPadding,
			bottom: DesignSystem.Guid.verticalPadding,
			right: DesignSystem.Guid.horizontalPadding
		)
		collectionViewLayout.sectionInsetReference = .fromContentInset
		collectionViewLayout.minimumLineSpacing = DesignSystem.Guid.verticalPadding
		collectionViewLayout.minimumInteritemSpacing = 0
		collectionViewLayout.scrollDirection = .vertical
		super.init(frame: .zero, collectionViewLayout: collectionViewLayout)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    private let collectionDelegate = TicketCollectionDelegate()
    private let collectionDataSources = TicketCollectionDataSources()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		collectionDataSources.update(with: viewProperties)
        self.setupCollectionView()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		collectionDataSources.update(with: viewProperties)
		self.setupCollectionView()
    }
    
    private func setupCollectionView() {
		self.showsHorizontalScrollIndicator = false
		self.delegate = self.collectionDelegate
		self.dataSource = self.collectionDataSources
		self.backgroundColor = DesignSystem.Color.background
		self.reloadData()
    }
}
