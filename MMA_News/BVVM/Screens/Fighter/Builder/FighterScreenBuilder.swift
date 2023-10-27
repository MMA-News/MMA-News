//
//  FighterScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Resolver
import UIKit
import Architecture

final class FighterScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = FighterScreenViewController
    typealias VM = FighterScreenViewManager
    
    public var view       : FighterScreenViewController
    public var viewManager: FighterScreenViewManager
    
    public static func build() -> FighterScreenViewControllerBuilder {
        let viewController = FighterScreenViewController()
        let viewManager    = FighterScreenViewManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = FighterScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: FighterScreenViewController,
        with viewManager: FighterScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

