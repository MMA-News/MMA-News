//
//  TournamentsScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Resolver
import UIKit
import Architecture

final class TournamentsScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = TournamentsScreenViewController
    typealias VM = TournamentsScreenViewManager
    
    public var view       : TournamentsScreenViewController
    public var viewManager: TournamentsScreenViewManager
    
    public static func build() -> TournamentsScreenViewControllerBuilder {
        let viewController = TournamentsScreenViewController()
        let viewManager    = TournamentsScreenViewManager(
            tournamentsFeature: Resolver.resolve()
        )
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = TournamentsScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: TournamentsScreenViewController,
        with viewManager: TournamentsScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

