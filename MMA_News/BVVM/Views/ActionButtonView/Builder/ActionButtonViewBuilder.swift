//
//  ActionButtonViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.03.2023.
//
import Resolver
import UIKit
import Architecture

final class ActionButtonViewBuilder: BuilderProtocol {
    
    typealias V  = ActionButtonView
    typealias VM = ActionButtonViewManager
    
    public var view       : ActionButtonView
    public var viewManager: ActionButtonViewManager
    
    public static func build() -> ActionButtonViewBuilder {
        let view        = ActionButtonView.loadNib()
        let viewManager = ActionButtonViewManager()
        viewManager.bind(with: view)
        let selfBuilder = ActionButtonViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: ActionButtonView,
        with viewManager: ActionButtonViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

