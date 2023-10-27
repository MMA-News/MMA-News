//
//  WarningViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import Foundation
import Architecture

final class WarningViewManager: ViewManager<WarningView> {
    
    var viewProperties: WarningView.ViewProperties?
    
    //MARK: - Main state view Manager
    enum State {
        case createViewProperties(NSAttributedString)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let attributedString):
                viewProperties = WarningView.ViewProperties(
                    attributedString: attributedString
                )
                create?(viewProperties)
        }
    }
}
