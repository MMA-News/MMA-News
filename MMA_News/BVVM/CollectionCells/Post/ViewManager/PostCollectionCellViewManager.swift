//
//  PostCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import Foundation
import Architecture

final class PostCollectionCellViewManager:  ViewManager<PostCollectionCell> {
    
    //MARK: - implementation protocol
    var viewProperties: PostCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(String)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let postText):
                viewProperties = PostCollectionCell.ViewProperties(
                    postText: postText
                )
                create?(viewProperties)
        }
    }
}
