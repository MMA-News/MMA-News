//
//  TournamentDetailCollectionViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import Resolver
import Architecture
import UIKit

final class TournamentDetailCollectionViewBuilder: BuilderProtocol {
    
    typealias V  = TournamentDetailCollectionView
    typealias VM = TournamentDetailCollectionViewManager
    
    public var view       : TournamentDetailCollectionView
    public var viewManager: TournamentDetailCollectionViewManager
    
    public static func build() -> TournamentDetailCollectionViewBuilder {
        let view        = TournamentDetailCollectionView.loadNib()
        let viewManager = TournamentDetailCollectionViewManager()
        viewManager.bind(with: view)
        let selfBuilder = TournamentDetailCollectionViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: TournamentDetailCollectionView,
        with viewManager: TournamentDetailCollectionViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

