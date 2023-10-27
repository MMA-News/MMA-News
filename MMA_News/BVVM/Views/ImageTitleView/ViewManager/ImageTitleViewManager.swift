//
//  ImageTitleViewViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class ImageTitleViewManager: ViewManager<ImageTitleView> {
    
    var viewProperties: ImageTitleView.ViewProperties?
    
    //MARK: - Main state view Manager
    enum State {
        case createViewProperties(
            attributedText: NSAttributedString?,
            image: UIImage?
        )
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let attributedText, let image):
                viewProperties = ImageTitleView.ViewProperties(
                    attributedText: attributedText,
                    image: image
                )
                create?(viewProperties)
        }
    }
}
