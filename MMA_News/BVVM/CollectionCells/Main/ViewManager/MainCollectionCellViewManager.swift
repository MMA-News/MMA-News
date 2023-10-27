//
//  MainCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import UIKit
import Architecture

final class MainCollectionCellViewManager: ViewManager<MainCollectionCell> {
    
    // MARK: - DI
    private let mainFeature: MainFeature
    
    init(
        mainFeature: MainFeature
    ) {
        self.mainFeature = mainFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: MainCollectionCell.ViewProperties?
    
    // MARK: - private properties
    private var mainCollectionType: MainCollectionType?
    private var mediaCollectionViewManager: MediaCollectionViewManager?
    private var newsPreviewCollectionViewManager: NewsPreviewCollectionViewManager?
    private var fightersCollectionViewManager: FightersCollectionViewManager?
	private var tournamentsCollectionViewManager: TournamentsCollectionViewManager?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(MainCollectionType)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let mainCollectionType):
                self.mainCollectionType = mainCollectionType
                viewProperties = MainCollectionCell.ViewProperties(
                    addView: addView
                )
                create?(viewProperties)
                subscribeUpdateMainFeature()
        }
    }
    
    private func addView(with containerView: UIView){
        switch self.mainCollectionType {
            case .media:
                addAndCreateMediaCollectionView(with: containerView)
                
            case .news:
                addAndCreateNewsCollectionView(with: containerView)
                
            case .fighters:
                addAndCreateFightersCollectionView(with: containerView)
				
			case .tournaments:
				addAndCreateTournamentsCollectionView(with: containerView)
                
            default:
                break
        }
    }
    
    private func addAndCreateMediaCollectionView(with containerView: UIView) {
        let mediaCollectionViewBuilder = MediaCollectionViewBuilder.build()
        let mediaCollectionView = mediaCollectionViewBuilder.view
        containerView.addSubview(mediaCollectionView)
        mediaCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mainFeature.getMedia()
        mediaCollectionViewManager = mediaCollectionViewBuilder.viewManager
    }
    
    private func addAndCreateNewsCollectionView(with containerView: UIView) {
        let newsPreviewCollectionViewBuilder = NewsPreviewCollectionViewBuilder.build()
        let newsPreviewCollectionView = newsPreviewCollectionViewBuilder.view
        containerView.addSubview(newsPreviewCollectionView)
        newsPreviewCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mainFeature.getNews()
        newsPreviewCollectionViewManager = newsPreviewCollectionViewBuilder.viewManager
    }
    
    private func addAndCreateFightersCollectionView(with containerView: UIView) {
        let fightersCollectionViewBuilder = FightersCollectionViewBuilder.build()
        let fightersCollectionView = fightersCollectionViewBuilder.view
        containerView.addSubview(fightersCollectionView)
        fightersCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mainFeature.getFighters()
        fightersCollectionViewManager = fightersCollectionViewBuilder.viewManager
    }
	
	private func addAndCreateTournamentsCollectionView(with containerView: UIView) {
		let tournamentsCollectionViewBuilder = TournamentsCollectionViewBuilder.build()
		let tournamentsCollectionView = tournamentsCollectionViewBuilder.view
		containerView.addSubview(tournamentsCollectionView)
		tournamentsCollectionView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		mainFeature.getTournaments()
		tournamentsCollectionViewManager = tournamentsCollectionViewBuilder.viewManager
	}
    
    private func subscribeUpdateMainFeature() {
        self.mainFeature.observeForUpdate { [weak self] feature in
            guard let self = self else { return }
            self.mediaCollectionViewManager?.state = .createViewProperties(feature.medias)
            self.newsPreviewCollectionViewManager?.state = .createViewProperties(feature.news)
            self.fightersCollectionViewManager?.state = .createViewProperties(feature.fighters, .horizontal)
			self.tournamentsCollectionViewManager?.state = .createViewProperties(feature.tournaments, .horizontal)
        }
    }
}
