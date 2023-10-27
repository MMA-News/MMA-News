//
//  YouTubeScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import YouTubePlayerKit
import WebKit
import Architecture

final class YouTubeScreenViewManager: ViewManager<YouTubeScreenViewController> {
    
    var viewProperties: YouTubeScreenViewController.ViewProperties?
    
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
                viewProperties = YouTubeScreenViewController.ViewProperties(
                    addYouTubeView: addAndCreateYouTubePlayerView
                )
                create?(viewProperties)
        }
    }
    
    private func addAndCreateYouTubePlayerView(with containerView: UIView) {
        let youTubePlayer: YouTubePlayer = "https://youtube.com/watch?v=psL_5RIBqnY"
        let youTubePlayerViewController = YouTubePlayerViewController(
            player: youTubePlayer
        )
        youTubePlayerViewController.player.showStatsForNerds()
        containerView.addSubview(youTubePlayerViewController.view)
        youTubePlayerViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
