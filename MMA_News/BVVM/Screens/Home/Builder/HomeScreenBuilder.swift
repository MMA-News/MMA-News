//
//  HomeScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import Resolver
import UIKit
import Architecture

final class HomeScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = HomeScreenViewController
    typealias VM = HomeScreenViewManager
    
    public var view       : HomeScreenViewController
    public var viewManager: HomeScreenViewManager
    
    public static func build() -> HomeScreenViewControllerBuilder {
        let viewController = HomeScreenViewController()
        let viewManager    = HomeScreenViewManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = HomeScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: HomeScreenViewController,
        with viewManager: HomeScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

