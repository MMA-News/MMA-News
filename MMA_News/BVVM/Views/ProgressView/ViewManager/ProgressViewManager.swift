//
//  ProgressViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import Foundation
import Architecture

final class ProgressViewManager: ViewManager<ProgressView> {
    
    var viewProperties: ProgressView.ViewProperties?
    
    //MARK: - Main state view Manager
    enum State {
        case createViewProperties(ProgressDirection)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let progressDirection):
                viewProperties = ProgressView.ViewProperties(
                    progressDirection: progressDirection
                )
                create?(viewProperties)
        }
    }
}
