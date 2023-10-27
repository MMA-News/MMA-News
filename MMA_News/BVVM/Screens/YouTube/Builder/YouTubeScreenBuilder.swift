//
//  YouTubeScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import Resolver
import UIKit
import Architecture

final class YouTubeScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = YouTubeScreenViewController
    typealias VM = YouTubeScreenViewManager
    
    public var view       : YouTubeScreenViewController
    public var viewManager: YouTubeScreenViewManager
    
    public static func build() -> YouTubeScreenViewControllerBuilder {
        let viewController = YouTubeScreenViewController()
        let viewManager    = YouTubeScreenViewManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = YouTubeScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: YouTubeScreenViewController,
        with viewManager: YouTubeScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

