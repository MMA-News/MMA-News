//
//  NewsScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import UIKit
import SnapKit
import Architecture
import Router

final class NewsScreenViewManager: ViewManager<NewsScreenViewController> {
    
    // MARK: - DI
    private let newsFeature: NewsFeature
    
    init(
        newsFeature: NewsFeature
    ) {
        self.newsFeature = newsFeature
    }
    
    var viewProperties: NewsScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    private var newsCollectionViewManager: NewsCollectionViewManager?
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = NewsScreenViewController.ViewProperties(
                    addCollectionView: addAndCreateNewsCollectionView
                )
                create?(viewProperties)
                subscribeUpdateFightersFeature()
        }
    }
    
    private func addAndCreateNewsCollectionView(with containerView: UIView) {
        let newsCollectionViewBuilder = NewsCollectionViewBuilder.build()
        let newsCollectionView = newsCollectionViewBuilder.view
        containerView.addSubview(newsCollectionView)
        newsCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.newsCollectionViewManager = newsCollectionViewBuilder.viewManager
    }
    
    private func subscribeUpdateFightersFeature() {
        newsFeature.getNews()
        self.newsFeature.observeForUpdate { [weak self] feature in
            guard let self = self else { return }
            let news = feature.news
            self.newsCollectionViewManager?.state = .createViewProperties(news, .vertical)
        }
    }
}
