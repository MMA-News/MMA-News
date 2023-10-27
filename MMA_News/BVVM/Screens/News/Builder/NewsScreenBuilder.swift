//
//  NewsScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import Resolver
import UIKit
import Architecture

final class NewsScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = NewsScreenViewController
    typealias VM = NewsScreenViewManager
    
    public var view       : NewsScreenViewController
    public var viewManager: NewsScreenViewManager
    
    public static func build() -> NewsScreenViewControllerBuilder {
        let viewController = NewsScreenViewController()
        let viewManager    = NewsScreenViewManager(
            newsFeature: Resolver.resolve()
        )
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = NewsScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: NewsScreenViewController,
        with viewManager: NewsScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

