//
//  NewsDetailScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 16.02.2023.
//
import UIKit
import Architecture

final class NewsDetailScreenViewManager: ViewManager<NewsDetailScreenViewController> {
    
    // MARK: - DI
    private let newsFeature: NewsFeature
    
    init(
        newsFeature: NewsFeature
    ) {
        self.newsFeature = newsFeature
    }
    
    var viewProperties: NewsDetailScreenViewController.ViewProperties?
    
    // MARK: - private properties
    var progressViewManager: ProgressViewManager?
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties(DECNew)
        case updateViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let news):
                self.viewProperties = NewsDetailScreenViewController.ViewProperties(
                    addProgressView: addAndCreateProgressView,
                    addActionView: addActionView,
                    news: news,
                    timeStart: "",
                    actionViewIsHide: false
                )
                create?(self.viewProperties)
                subscribeUpdateNewFeature()
                newsFeature.timeDistance(with: news.date)
            case .updateViewProperties:
                update?(viewProperties)
        }
    }
    
    private func addAndCreateProgressView(with containerView: UIView) {
        let progressViewBuilder = ProgressViewBuilder.build()
        let progressViewBuilderView = progressViewBuilder.view
        containerView.addSubview(progressViewBuilderView)
        progressViewBuilderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.progressViewManager = progressViewBuilder.viewManager
        self.progressViewManager?.state = .createViewProperties(.red)
    }
    
    private func addActionView(with containerView: UIView) {
        let actionButtonViewBuilder = ActionButtonViewBuilder.build()
        let actionButtonViewBuilderView = actionButtonViewBuilder.view
        containerView.addSubview(actionButtonViewBuilderView)
        actionButtonViewBuilderView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let viewProperties = ActionButtonView.ViewProperties(
            action: {},
            title: "Купить билеты".bodySmall(color: .black))
        actionButtonViewBuilder.viewManager.state = .createViewProperties(viewProperties)
    }
    
    private func subscribeUpdateNewFeature() {
        self.newsFeature.observeForUpdate { [weak self] feature in
            guard let self = self else { return }
            switch feature.newsState {
                case .start:
                    print("")
                case .finish(let state):
                    self.viewProperties?.timeStart = state
                    self.progressViewManager?.state = .createViewProperties(.red)
                    self.viewProperties?.actionViewIsHide = true
                    
                case .noStart(let state):
                    self.viewProperties?.timeStart = state
                    self.progressViewManager?.state = .createViewProperties(.left(20))
                    self.viewProperties?.actionViewIsHide = false
            }
            self.state = .updateViewProperties
        }
    }
}
