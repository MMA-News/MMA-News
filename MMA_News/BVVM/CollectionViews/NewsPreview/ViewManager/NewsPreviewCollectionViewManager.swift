//
//  NewsPreviewCollectionViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import Resolver
import Architecture
import UIKit

final class NewsPreviewCollectionViewManager: ViewManager<NewsPreviewCollectionView> {
    
    // MARK: - DI
    private let newsFeature: NewsFeature
    
    init(
        newsFeature: NewsFeature
    ) {
        self.newsFeature = newsFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: NewsPreviewCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties([DECNew])
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let news):
                viewProperties = NewsPreviewCollectionView.ViewProperties(
                    news: news,
                    didTapCell: self.newsFeature.didTapNews
                )
                create?(viewProperties)
        }
    }
}
