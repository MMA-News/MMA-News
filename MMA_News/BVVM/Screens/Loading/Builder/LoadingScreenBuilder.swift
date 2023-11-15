//
//  LoadingScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import Resolver
import UIKit
import Architecture

final class LoadingScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = LoadingScreenViewController
    typealias VM = LoadingScreenViewManager
    
    public var view       : LoadingScreenViewController
    public var viewManager: LoadingScreenViewManager
    
    public static func build() -> LoadingScreenViewControllerBuilder {
        let viewController = LoadingScreenViewController()
        let viewManager    = LoadingScreenViewManager(
            routerService: Resolver.resolve()
        )
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = LoadingScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: LoadingScreenViewController,
        with viewManager: LoadingScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

