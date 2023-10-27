//
//  MediaCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import YouTubePlayerKit
import Architecture
import Router

final class MediaCollectionCellViewManager:  ViewManager<MediaCollectionCell> {
    
    // MARK: - DI
    private let routerService: RouterService
    
    init(
        routerService: RouterService
    ) {
        self.routerService = routerService
    }
    
    //MARK: - implementation protocol
    var viewProperties: MediaCollectionCell.ViewProperties?
    
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(DECMedia)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let media):
                viewProperties = MediaCollectionCell.ViewProperties(
                    title: media.title.H316(color: .white),
                    date: media.date.body10(color: DesignSystem.Color.grayNight500),
                    imageURL: media.photoURL,
                    videoURL: media.videoURL,
                    didTapMedia: didTapMedia
                )
                create?(viewProperties)
        }
    }
    
    private func didTapMedia(with videoURL: String){
       
        let configuration = YouTubePlayer.Configuration(
            // Define which fullscreen mode should be used (system or web)
            fullscreenMode: .system,
            // Enable auto play
            autoPlay: true,
            // Hide controls
            showControls: true,
            // Enable loop
            loopEnabled: true
        )
        let youTubePlayer = YouTubePlayer(stringLiteral: videoURL)
        youTubePlayer.configuration = configuration
        let youTubePlayerViewController = YouTubePlayerViewController(
            player: youTubePlayer
        )
        routerService.present(
            with: .viewController(youTubePlayerViewController)
        )
        let button = UIButton(type: .close)
        button.cornerRadius(
            radius: 12.5,
            direction: .allCorners,
            clipsToBounds: true
        )
        button.backgroundColor = .white
        button.tintColor = .white
        button.imageView?.tintColor = .white
        button.frame = CGRect(x: 16, y: 32, width: 25, height: 25)
        youTubePlayerViewController.view.addSubview(button)
        let selector = #selector(close)
        button.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    @objc private func close(){
        routerService.dismiss(animated: true)
    }
}
