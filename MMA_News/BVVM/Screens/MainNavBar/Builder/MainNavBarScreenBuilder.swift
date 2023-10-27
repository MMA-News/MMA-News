//
//  MainNavBarScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Resolver
import UIKit
import Architecture

final class MainNavBarScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = MainNavBarScreenViewController
    typealias VM = MainNavBarScreenViewManager
    
    public var view       : MainNavBarScreenViewController
    public var viewManager: MainNavBarScreenViewManager
    
    public static func build(with rootViewController: UIViewController) -> MainNavBarScreenViewControllerBuilder {
        let viewController = MainNavBarScreenViewController(
            rootViewController: rootViewController
        )
        let viewManager = MainNavBarScreenViewManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = MainNavBarScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: MainNavBarScreenViewController,
        with viewManager: MainNavBarScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

