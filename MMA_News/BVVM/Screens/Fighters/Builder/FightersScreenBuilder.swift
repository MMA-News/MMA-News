//
//  FightersScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import Resolver
import UIKit
import Architecture

final class FightersScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = FightersScreenViewController
    typealias VM = FightersScreenViewManager
    
    public var view       : FightersScreenViewController
    public var viewManager: FightersScreenViewManager
    
    public static func build() -> FightersScreenViewControllerBuilder {
        let viewController = FightersScreenViewController()
        let viewManager    = FightersScreenViewManager(
            fightersFeature: Resolver.resolve()
        )
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = FightersScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: FightersScreenViewController,
        with viewManager: FightersScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

