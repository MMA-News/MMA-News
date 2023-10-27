//
//  ImageTitleViewView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class ImageTitleView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let attributedText: NSAttributedString?
        let image: UIImage?
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var iconImageView: UIImageView!
    @IBOutlet weak private var textLabel: UILabel!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData(with: viewProperties)
    }
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData(with: viewProperties)
    }
    
    private func setData(with viewProperties: ViewProperties?){
        guard let attributedText = viewProperties?.attributedText else {
            SkeletonService.shared.action(
                state: .show([iconImageView, textLabel], [DesignSystem.Color.background, DesignSystem.Color.grayNight700])
            )
            return
        }
        iconImageView.image = viewProperties?.image
        textLabel.attributedText = attributedText
        SkeletonService.shared.action(
            state: .hide([iconImageView, textLabel])
        )
    }
}
