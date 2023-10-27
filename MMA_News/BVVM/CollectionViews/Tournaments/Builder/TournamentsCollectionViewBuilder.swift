//
//  TournamentsCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Resolver
import Architecture
import UIKit

final class TournamentsCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = TournamentsCollectionView
    typealias VM = TournamentsCollectionViewManager
    
    public var view       : TournamentsCollectionView
    public var viewManager: TournamentsCollectionViewManager
    
    public static func build() -> TournamentsCollectionViewBuilder {
        let view        = TournamentsCollectionView.loadNib()
        let viewManager = TournamentsCollectionViewManager(
            tournamentsFeature: Resolver.resolve()
        )
        viewManager.bind(with: view)
        let selfBuilder = TournamentsCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: TournamentsCollectionView,
        with viewManager: TournamentsCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

