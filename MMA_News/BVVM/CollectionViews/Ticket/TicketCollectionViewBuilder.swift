//
//  TicketCollectionViewBuilder.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import Resolver
import Architecture
import UIKit

final class TicketCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = TicketCollectionView
    typealias VM = TicketCollectionViewManager
    
    public var view : TicketCollectionView
    public var viewManager: TicketCollectionViewManager
    
    public static func build() -> TicketCollectionViewBuilder {
        let view = TicketCollectionView()
        let viewManager = TicketCollectionViewManager()
        viewManager.bind(with: view)
        let selfBuilder = TicketCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: TicketCollectionView,
        with viewManager: TicketCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

