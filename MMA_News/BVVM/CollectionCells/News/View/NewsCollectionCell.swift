//
//  NewsCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Architecture

final class NewsCollectionCell: UICollectionViewCell, ViewProtocol {
    
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
    @IBOutlet weak private var postLabel     : UILabel!
    @IBOutlet weak private var dateLabel     : UILabel!
    
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
        nameLabel.attributedText = news.title.H2(color: .white)
        postLabel.attributedText = news.post.body12(color: .white)
        dateLabel.attributedText = news
            .date
            .convert(from: .fullData_Time,
                     to: .dayMonthYear)?
            .body14(color: .white)
    }
    
    private func setPhoto(){
        guard let news = self.viewProperties?.news else { return }
        let url = URL(string: news.photoURL)
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
    }
    
    //MARK: -
    @IBAction func actionButton(button: UIButton){
        self.viewProperties?.action()
    }
}
