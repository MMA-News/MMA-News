//
//  NewsCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Resolver
import Architecture
import UIKit

final class NewsCollectionViewManager: ViewManager<NewsCollectionView> {
    
    // MARK: - DI
    private let newsFeature: NewsFeature
    
    init(
        newsFeature: NewsFeature
    ) {
        self.newsFeature = newsFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: NewsCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties([DECNew], UICollectionView.ScrollDirection)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let news, let scrollDirection):
                viewProperties = NewsCollectionView.ViewProperties(
                    news: news,
                    didTapCell: self.newsFeature.didTapNews,
                    scrollDirection: scrollDirection
                )
                create?(viewProperties)
        }
    }
}
