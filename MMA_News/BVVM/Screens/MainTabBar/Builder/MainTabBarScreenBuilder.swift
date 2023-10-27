//
//  MainTabBarScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import Resolver
import UIKit
import Architecture

final class MainTabBarScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = MainTabBarScreenViewController
    typealias VM = MainTabBarScreenViewManager
    
    public var view       : MainTabBarScreenViewController
    public var viewManager: MainTabBarScreenViewManager
    
    public static func build() -> MainTabBarScreenViewControllerBuilder {
        let viewController = MainTabBarScreenViewController()
        let viewManager    = MainTabBarScreenViewManager(
            tabBarControllersService: Resolver.resolve(),
            routerService: Resolver.resolve()
        )
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = MainTabBarScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: MainTabBarScreenViewController,
        with viewManager: MainTabBarScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

