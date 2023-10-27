//
//  MainScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import Resolver
import UIKit
import Architecture

final class MainScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = MainScreenViewController
    typealias VM = MainScreenViewManager
    
    public var view       : MainScreenViewController
    public var viewManager: MainScreenViewManager
    
    public static func build() -> MainScreenViewControllerBuilder {
        let viewController = MainScreenViewController()
        let viewManager    = MainScreenViewManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = MainScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: MainScreenViewController,
        with viewManager: MainScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

