//
//  WarningView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import UIKit
import Architecture

final class WarningView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let attributedString: NSAttributedString
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet private weak var warningTextLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cornerRadius(
            radius: 8,
            direction: .allCorners,
            clipsToBounds: true
            )
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.warningTextLabel.attributedText = viewProperties?.attributedString
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.warningTextLabel.attributedText = viewProperties?.attributedString
    }
}
