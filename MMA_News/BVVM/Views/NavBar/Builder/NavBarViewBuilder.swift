//
//  NavBarViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Resolver
import UIKit
import Architecture

final class NavBarViewBuilder: BuilderProtocol {
    
    typealias V  = NavBarView
    typealias VM = NavBarViewManager
    
    public var view       : NavBarView
    public var viewManager: NavBarViewManager
    
    public static func build() -> NavBarViewBuilder {
        let view        = NavBarView.loadNib()
        let viewManager = NavBarViewManager(
            navBarFeature: Resolver.resolve(),
            routerService: Resolver.resolve()
        )
        viewManager.bind(with: view)
        let selfBuilder = NavBarViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: NavBarView,
        with viewManager: NavBarViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

