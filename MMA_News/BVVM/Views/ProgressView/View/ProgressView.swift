//
//  ProgressView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class ProgressView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let progressDirection: ProgressDirection
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var progressView: UIView!
    @IBOutlet weak private var leadingConstant: NSLayoutConstraint!
    @IBOutlet weak private var trailingConstant: NSLayoutConstraint!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setProgress()
    }
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setProgress()
    }
    
    private func setProgress(){
        guard let viewProperties = self.viewProperties else { return }
        switch viewProperties.progressDirection {
                
            case .left(let progress):
                trailingConstant.constant = progress
                
            case .right(let progress):
                leadingConstant.constant = progress
                progressView.backgroundColor = DesignSystem.Color.green900
                
            case .red:
                leadingConstant.constant = 0
                progressView.backgroundColor = DesignSystem.Color.red900
                
            case .green:
                leadingConstant.constant = 0
                progressView.backgroundColor = DesignSystem.Color.green900
        }
        
    }
}

enum ProgressDirection {
    case left(CGFloat)
    case right(CGFloat)
    case red
    case green
}
