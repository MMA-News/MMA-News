//
//  TicketViewBuilder.swift
//  MMA_News
//
//  Created by Senior Developer on 09.11.2023.
//
import Resolver
import UIKit
import Architecture

final class TicketViewBuilder: BuilderProtocol {
    
    typealias V = TicketView
    typealias VM = TicketViewManager
    
    public var view: TicketView
    public var viewManager: TicketViewManager
    
    public static func build() -> TicketViewBuilder {
        let view = TicketView.createForXib()
        let viewManager = TicketViewManager()
        viewManager.bind(with: view)
        let selfBuilder = TicketViewBuilder(
            with: view,
            with: viewManager
        )
        return selfBuilder
    }
    
    private init(
        with view: TicketView,
        with viewManager: TicketViewManager
    ) {
        self.view = view
        self.viewManager = viewManager
    }
}

