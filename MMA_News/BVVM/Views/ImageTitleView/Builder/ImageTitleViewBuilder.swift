//
//  ImageTitleViewViewBuilder.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import Resolver
import UIKit
import Architecture

final class ImageTitleViewBuilder: BuilderProtocol {
    
    typealias V  = ImageTitleView
    typealias VM = ImageTitleViewManager
    
    public var view       : ImageTitleView
    public var viewManager: ImageTitleViewManager
    
    public static func build() -> ImageTitleViewBuilder {
        let view        = ImageTitleView.loadNib()
        let viewManager = ImageTitleViewManager()
        viewManager.bind(with: view)
        let selfBuilder = ImageTitleViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: ImageTitleView,
        with viewManager: ImageTitleViewManager
    ) {
        self.view        = view
        self.viewManager = viewManager
    }
}

