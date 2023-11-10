//
//  TicketCollectionCellViewManager.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import Foundation
import Architecture

final class TicketCollectionCellViewManager:  ViewManager<TicketCollectionCell> {
    
    //MARK: - implementation protocol
    var viewProperties: TicketCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(TicketCollectionCell.ViewProperties)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let viewProperties):
				self.viewProperties = viewProperties
				self.create?(self.viewProperties)
        }
    }
}
