//
//  FighterCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 14.02.2023.
//
import UIKit
import Kingfisher
import Architecture

final class FighterCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let fighter: DECFighter
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var nameLabel       : UILabel!
    @IBOutlet weak private var photoImageView  : UIImageView!
    @IBOutlet weak private var fightsLabel     : UILabel!
    @IBOutlet weak private var clubLabel       : UILabel!
    @IBOutlet weak private var cityLabel       : UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData()
        setPhoto()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData()
        setPhoto()
    }
    
    private func setData(){
        guard let fighter = self.viewProperties?.fighter else { return }
        nameLabel.text = fighter.name
        fightsLabel.text = fighter.fights
        clubLabel.text = fighter.club
        cityLabel.text = fighter.city
    }
    
    private func setPhoto(){
        guard let fighter = self.viewProperties?.fighter else { return }
        let url = URL(string: fighter.photoURL)
        photoImageView.sd_setImage(with: url, placeholderImage: .set(.fighterPreview))
        layoutIfNeeded()
    }
    
    private func setup(){
        self.cornerRadius(
            corners: .allCorners,
            radius: DesignSystem.Guid.cornerRadius
        )
        photoImageView.cornerRadius(
            radius: photoImageView.bounds.height / 2,
            direction: .allCorners,
            clipsToBounds: true
        )
    }
}
