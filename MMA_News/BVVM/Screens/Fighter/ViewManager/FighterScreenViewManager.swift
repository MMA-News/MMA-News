//
//  FighterScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Foundation
import Architecture

final class FighterScreenViewManager: ViewManager<FighterScreenViewController> {
    
    var viewProperties: FighterScreenViewController.ViewProperties?
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                print("")
        }
    }
}
