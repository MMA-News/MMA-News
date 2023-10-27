//
//  WebContentScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Resolver
import UIKit
import Architecture

final class WebContentScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = WebContentScreenViewController
    typealias VM = WebContentScreenViewManager
    
    public var view       : WebContentScreenViewController
    public var viewManager: WebContentScreenViewManager
    
    public static func build() -> WebContentScreenViewControllerBuilder {
        let viewController = WebContentScreenViewController()
        let viewManager    = WebContentScreenViewManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = WebContentScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: WebContentScreenViewController,
        with viewManager: WebContentScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

