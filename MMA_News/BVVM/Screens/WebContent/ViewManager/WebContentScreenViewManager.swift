//
//  WebContentScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import Foundation
import Architecture

final class WebContentScreenViewManager: ViewManager<WebContentScreenViewController> {
    
    var viewProperties: WebContentScreenViewController.ViewProperties?
    
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
                viewProperties = WebContentScreenViewController.ViewProperties(
                    urlString: "https://hardcorefc.ru/"
                )
               create?(viewProperties)
        }
    }
}
