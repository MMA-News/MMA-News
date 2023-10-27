//
//  MainNewBannerCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class MainNewBannerCollectionCellViewManager: ViewManager<MainNewBannerCollectionCell> {
    
    // MARK: - DI
    private let mainFeature: MainFeature
    
    init(
        mainFeature: MainFeature
    ) {
        self.mainFeature = mainFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: MainNewBannerCollectionCell.ViewProperties?
    
    // MARK: - private properties
    private var mapImageTitleViewManager: ImageTitleViewManager?
    private var dateImageTitleViewManager: ImageTitleViewManager?
    private var clockImageTitleViewManager: ImageTitleViewManager?
    private var progressViewManager: ProgressViewManager?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = MainNewBannerCollectionCell.ViewProperties(
                    mapImageTitleViewView: addAndCreateMapImageTitleView,
                    dateImageTitleViewView: addAndCreateDateImageTitleView,
                    clockImageTitleViewView: addAndCreateClockImageTitleViewView,
                    progressView: addAndCreateProgressView,
                    attributedTitle: nil,
                    imageURL: nil
                )
                create?(viewProperties)
                subscribeUpdateMainFeature()
        }
    }
    
    private func addAndCreateMapImageTitleView(with containerView: UIView) {
        let imageTitleViewViewBuilder = ImageTitleViewBuilder.build()
        let imageTitleViewView = imageTitleViewViewBuilder.view
        containerView.addSubview(imageTitleViewView)
        imageTitleViewView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mapImageTitleViewManager = imageTitleViewViewBuilder.viewManager
        mapImageTitleViewManager?.state = .createViewProperties(
            attributedText: nil,
            image: nil
        )
    }
    
    private func addAndCreateDateImageTitleView(with containerView: UIView) {
        let imageTitleViewViewBuilder = ImageTitleViewBuilder.build()
        let imageTitleViewView = imageTitleViewViewBuilder.view
        containerView.addSubview(imageTitleViewView)
        imageTitleViewView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dateImageTitleViewManager = imageTitleViewViewBuilder.viewManager
        dateImageTitleViewManager?.state = .createViewProperties(
            attributedText: nil,
            image: nil
        )
    }
    
    private func addAndCreateClockImageTitleViewView(with containerView: UIView) {
        let imageTitleViewViewBuilder = ImageTitleViewBuilder.build()
        let imageTitleViewView = imageTitleViewViewBuilder.view
        containerView.addSubview(imageTitleViewView)
        imageTitleViewView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        clockImageTitleViewManager = imageTitleViewViewBuilder.viewManager
        clockImageTitleViewManager?.state = .createViewProperties(
            attributedText: nil,
            image: nil
        )
    }
    
    private func addAndCreateProgressView(with containerView: UIView) {
        let progressViewBuilder = ProgressViewBuilder.build()
        let progressView = progressViewBuilder.view
        containerView.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        progressViewManager = progressViewBuilder.viewManager
    }
    
    private func subscribeUpdateMainFeature() {
        self.mainFeature.observeForUpdate { [weak self] feature in
            guard let self = self else { return }
            guard let mainNews = feature.mainNews else { return }
            switch feature.newsState {
                case .start:
                    print("")
                case .finish(let state):
                    //self.viewProperties?.timeStart = state
                    self.progressViewManager?.state = .createViewProperties(.red)
                    //self.viewProperties?.actionViewIsHide = true
                    
                case .noStart(let state):
                    //self.viewProperties?.timeStart = state
                    self.progressViewManager?.state = .createViewProperties(.left(20))
                    //self.viewProperties?.actionViewIsHide = false
            }
            
            self.clockImageTitleViewManager?.state = .createViewProperties(
                attributedText: "18:00".body12(color: DesignSystem.Color.grayNight700),
                image: DesignSystem.Image.clock
            )
            
            self.dateImageTitleViewManager?.state = .createViewProperties(
                attributedText: mainNews.date.body12(color: DesignSystem.Color.grayNight700),
                image: DesignSystem.Image.calendar
            )
            
            self.mapImageTitleViewManager?.state = .createViewProperties(
                attributedText: mainNews.city?.body12(color: DesignSystem.Color.grayNight700),
                image: DesignSystem.Image.map
            )
            
            self.viewProperties?.attributedTitle = mainNews.title.H2(color: .white)
            self.viewProperties?.imageURL = mainNews.photoURL
            self.update?(self.viewProperties)
        }
    }
}
