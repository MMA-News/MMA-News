//
//  MainNewBannerCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class MainNewBannerCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let mapImageTitleViewView: Closure<UIView>
        let dateImageTitleViewView: Closure<UIView>
        let clockImageTitleViewView: Closure<UIView>
        let progressView: Closure<UIView>
        var attributedTitle: NSAttributedString?
        var imageURL: String?
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var mapImageTitleViewView: UIView!
    @IBOutlet weak private var dateImageTitleViewView: UIView!
    @IBOutlet weak private var clockImageTitleViewView: UIView!
    @IBOutlet weak private var progressView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var newsImageView: UIImageView!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData()
        setPhoto()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.mapImageTitleViewView(mapImageTitleViewView)
        self.viewProperties?.dateImageTitleViewView(dateImageTitleViewView)
        self.viewProperties?.clockImageTitleViewView(clockImageTitleViewView)
        self.viewProperties?.progressView(progressView)
        setData()
        setPhoto()
    }
    
    private func setData(){
        guard let attributedTitle = viewProperties?.attributedTitle else {
            SkeletonService.shared.action(
                state: .show([titleLabel], [DesignSystem.Color.background, DesignSystem.Color.grayNight700])
            )
            return
        }
        titleLabel.attributedText = attributedTitle
        SkeletonService.shared.action(
            state: .hide([titleLabel])
        )
    }
    
    private func setPhoto(){
        layoutIfNeeded()
        guard let imageURL = self.viewProperties?.imageURL else {
            SkeletonService.shared.action(
                state: .show([self], [DesignSystem.Color.background, DesignSystem.Color.grayNight700])
            )
            return
        }
        let url = URL(string: imageURL)
        SkeletonService.shared.action(
            state: .show([self], [DesignSystem.Color.background, DesignSystem.Color.grayNight700, DesignSystem.Color.grayNight700])
        )
        newsImageView.sd_setImage(with: url) { [weak self] (_, error, _, url) in
            guard let self = self else { return }
            SkeletonService.shared.action(
                state: .hide([self])
            )
        }
    }
}
