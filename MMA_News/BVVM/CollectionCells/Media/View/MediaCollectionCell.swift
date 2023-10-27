//
//  MediaCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class MediaCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let title: NSAttributedString
        let date: NSAttributedString
        let imageURL: String
        let videoURL: String
        let didTapMedia: Closure<String>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var actionView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var photoImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData()
        setPhoto()
    }
    
    private func setData(){
        guard let viewProperties = self.viewProperties else { return }
        titleLabel.attributedText = viewProperties.title
        dateLabel.attributedText = viewProperties.date
    }
    
    private func setPhoto(){
        guard let imageURL = self.viewProperties?.imageURL else { return }
        let url = URL(string: imageURL)
        SkeletonService.shared.action(
            state: .show([photoImageView], [DesignSystem.Color.background, DesignSystem.Color.grayNight700])
        )
        photoImageView.sd_setImage(with: url) { [weak self] (_, error, _, url) in
            guard let self = self else { return }
            SkeletonService.shared.action(
                state: .hide([self.photoImageView])
            )
        }
    }
    
    private func setup(){
        self.cornerRadius(
            corners: .allCorners,
            radius: DesignSystem.Guid.cornerRadius
        )
        actionView.cornerRadius(corners: .topLeft, radius: 8)
        actionView.cornerRadius(corners: .bottomRight, radius: 8)
    }
    
    //MARK: -
    @IBAction func didTapButton(button: UIButton){
        guard let videoURL = viewProperties?.videoURL else { return }
        self.viewProperties?.didTapMedia(videoURL)
    }
    
}
