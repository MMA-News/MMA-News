//
//  ProgressViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import Resolver
import UIKit
import Architecture

final class ProgressViewBuilder: BuilderProtocol {
    
    typealias V  = ProgressView
    typealias VM = ProgressViewManager
    
    public var view       : ProgressView
    public var viewManager: ProgressViewManager
    
    public static func build() -> ProgressViewBuilder {
        let view        = ProgressView.loadNib()
        let viewManager = ProgressViewManager()
        viewManager.bind(with: view)
        let selfBuilder = ProgressViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: ProgressView,
        with viewManager: ProgressViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

