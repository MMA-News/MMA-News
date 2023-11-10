//
//  TicketViewManager.swift
//  MMA_News
//
//  Created by Senior Developer on 09.11.2023.
//
import Foundation
import Architecture

final class TicketViewManager: ViewManager<TicketView> {
    
    var viewProperties: TicketView.ViewProperties?
    
    //MARK: - Main state view Manager
    enum State {
        case createViewProperties(TicketView.ViewProperties)
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
