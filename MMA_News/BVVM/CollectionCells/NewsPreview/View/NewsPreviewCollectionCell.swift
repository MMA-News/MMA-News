//
//  NewsPreviewCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import UIKit
import Architecture

final class NewsPreviewCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let news: DECNew
        let action: ClosureEmpty
    }
    var viewProperties: ViewProperties?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    @IBOutlet weak private var nameLabel     : UILabel!
    @IBOutlet weak private var photoImageView: UIImageView!
    
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
        guard let news = self.viewProperties?.news else { return }
        nameLabel.attributedText = news.title.H316(color: .white)
    }
    
    private func setPhoto(){
        guard let news = self.viewProperties?.news else { return }
        let url = URL(string: news.photoURL)
        photoImageView.sd_setImage(with: url)
    }
    
    private func setup(){
        self.cornerRadius(
            corners: .allCorners,
            radius: DesignSystem.Guid.cornerRadius
        )
    }
    
    //MARK: -
    @IBAction func actionButton(button: UIButton){
        self.viewProperties?.action()
    }
}
