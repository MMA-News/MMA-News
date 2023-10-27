//
//  TournamentDetailScreenBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 28.02.2023.
//
import Resolver
import UIKit
import Architecture

final class TournamentDetailScreenViewControllerBuilder: BuilderProtocol {
    
    typealias V  = TournamentDetailScreenViewController
    typealias VM = TournamentDetailScreenViewManager
    
    public var view       : TournamentDetailScreenViewController
    public var viewManager: TournamentDetailScreenViewManager
    
    public static func build() -> TournamentDetailScreenViewControllerBuilder {
        let viewController = TournamentDetailScreenViewController()
        let viewManager    = TournamentDetailScreenViewManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = TournamentDetailScreenViewControllerBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: TournamentDetailScreenViewController,
        with viewManager: TournamentDetailScreenViewManager
    ) {
        self.view        = viewController
        self.viewManager = viewManager
    }
}

