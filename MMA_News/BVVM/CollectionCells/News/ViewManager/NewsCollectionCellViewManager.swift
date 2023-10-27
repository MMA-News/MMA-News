//
//  NewsCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Foundation
import Architecture

final class NewsCollectionCellViewManager:  ViewManager<NewsCollectionCell> {
    
    // MARK: - DI
    private let newsFeature: NewsFeature
    
    init(
        newsFeature: NewsFeature
    ) {
        self.newsFeature = newsFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: NewsCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(DECNew, IndexPath)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let news, let indexPath):
                viewProperties = NewsCollectionCell.ViewProperties(
                    news: news,
                    action: { 
                        self.newsFeature.didTapNews(with: indexPath)
                    }
                )
                create?(viewProperties)
        }
    }
}
