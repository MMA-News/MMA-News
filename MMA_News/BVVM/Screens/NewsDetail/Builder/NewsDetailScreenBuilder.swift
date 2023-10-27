//
//  NewsDetailScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 16.02.2023.
//
import Resolver
import UIKit
import Architecture

final class NewsDetailScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = NewsDetailScreenViewController
    typealias VM = NewsDetailScreenViewManager
    
    public var view       : NewsDetailScreenViewController
    public var viewManager: NewsDetailScreenViewManager
    
    public static func build() -> NewsDetailScreenViewControllerBuilder {
        let viewController = NewsDetailScreenViewController()
        let viewManager    = NewsDetailScreenViewManager(
            newsFeature: Resolver.resolve()
        )
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = NewsDetailScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: NewsDetailScreenViewController,
        with viewManager: NewsDetailScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

