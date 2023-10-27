//
//  ActionButtonViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.03.2023.
//
import Foundation
import Architecture

final class ActionButtonViewManager: ViewManager<ActionButtonView> {
    
    var viewProperties: ActionButtonView.ViewProperties?
    
    //MARK: - Main state view Manager
    enum State {
        case createViewProperties(ActionButtonView.ViewProperties)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let viewProperties):
                self.viewProperties = viewProperties
                create?(self.viewProperties)
        }
    }
}
