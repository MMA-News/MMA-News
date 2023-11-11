//
//  TicketVCManager.swift
//  MMA_News
//
//  Created by IOS Developer on 08.11.2023.
//
import Foundation
import Architecture

final class TicketVCManager: ViewManager<TicketVC> {
    
    var viewProperties: TicketVC.ViewProperties?
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties(TicketVC.ViewProperties)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let viewProperties):
				self.viewProperties = viewProperties
				self.create?(self.viewProperties)
        }
    }
}
