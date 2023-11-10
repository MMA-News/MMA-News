//
//  TicketCollectionView.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import UIKit
import Architecture

final class TicketCollectionView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let cellsCount: Int
    }
    var viewProperties: ViewProperties?
	
	init() {
		let collectionViewLayout = TicketCollectionViewLayout()
		collectionViewLayout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
		collectionViewLayout.sectionInsetReference = .fromContentInset
		collectionViewLayout.minimumLineSpacing = 0
		collectionViewLayout.minimumInteritemSpacing = 0
		collectionViewLayout.scrollDirection = .vertical
		super.init(frame: .zero, collectionViewLayout: collectionViewLayout)
	}
    
    private let collectionDelegate = TicketCollectionDelegate()
    private let collectionDataSources = TicketCollectionDataSources()
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setupCollectionView()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    private func setupCollectionView() {
		self.showsHorizontalScrollIndicator = false
		self.delegate = self.collectionDelegate
		self.dataSource = self.collectionDataSources
		self.reloadData()
    }
}
