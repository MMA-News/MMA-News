//
//  TicketVCBuilder.swift
//  MMA_News
//
//  Created by IOS Developer on 08.11.2023.
//
import Resolver
import UIKit
import Architecture

final class TicketVCBuilder: BuilderProtocol {
    
    typealias V = TicketVC
    typealias VM = TicketVCManager
    
    public var view: TicketVC
    public var viewManager: TicketVCManager
    
    public static func build() -> TicketVCBuilder {
        let viewController = TicketVC()
        let viewManager = TicketVCManager()
        viewController.loadViewIfNeeded()
        viewManager.bind(with: viewController)
        let selfBuilder = TicketVCBuilder(
            with: viewController,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with viewController: TicketVC,
        with viewManager: TicketVCManager
    ) {
        self.view = viewController
        self.viewManager = viewManager
    }
}

