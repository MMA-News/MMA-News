//
//  TicketCollectionViewManager.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import Resolver
import Architecture
import UIKit

final class TicketCollectionViewManager: ViewManager<TicketCollectionView> {
    
    //MARK: - implementation protocol
    var viewProperties: TicketCollectionView.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(TicketCollectionView.ViewProperties)
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
