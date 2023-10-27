//
//  WarningViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import Resolver
import UIKit
import Architecture

final class WarningViewBuilder: BuilderProtocol {
    
    typealias V  = WarningView
    typealias VM = WarningViewManager
    
    public var view       : WarningView
    public var viewManager: WarningViewManager
    
    public static func build() -> WarningViewBuilder {
        let view        = WarningView.loadNib()
        let viewManager = WarningViewManager()
        viewManager.bind(with: view)
        let selfBuilder = WarningViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: WarningView,
        with viewManager: WarningViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

