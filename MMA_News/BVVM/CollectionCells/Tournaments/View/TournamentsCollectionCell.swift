//
//  TournamentsCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import SDWebImage
import Architecture

final class TournamentsCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let tournament: DECTournament
        let didTabBuy: ClosureEmpty
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var titleLabel    : UILabel!
    @IBOutlet weak private var leftImageView : UIImageView!
    @IBOutlet weak private var rightImageView: UIImageView!
    @IBOutlet weak private var cityLabel     : UILabel!
    @IBOutlet weak private var dateLabel     : UILabel!
    @IBOutlet weak private var timeLabel     : UILabel!
    @IBOutlet weak private var buttonView    : UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leftImageView.image = nil
        rightImageView.image = nil
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
        setupButtonView()
    }
    
    private func setData(){
        guard let tournament = self.viewProperties?.tournament else { return }
        titleLabel.text = tournament.title
        cityLabel.text = tournament.city
        dateLabel.text = tournament.date.convert(from: .fullData_Time, to: .dayMonthYear)
        timeLabel.text = tournament.date.convert(from: .fullData_Time, to: .time)
    }
    
    private func setPhoto(){
        guard let tournament = self.viewProperties?.tournament else { return }
        let leftUrl = URL(string: tournament.leftPhotoUrl)
        let rightUrl = URL(string: tournament.rightPhotoUrl)
        leftImageView.sd_setImage(with: leftUrl, placeholderImage: .set(.fighterPreview)) { _, error, _, url in
            
        }
        rightImageView.sd_setImage(with: rightUrl, placeholderImage: .set(.fighterPreview)) { _, error, _, url in
            
        }
    }
    
    private func setupButtonView(){
        buttonView.isHidden = false
    }
    
    private func setup(){
        self.cornerRadius(
            corners: .allCorners,
            radius: DesignSystem.Guid.cornerRadius
        )
    }
    
    //MARK: -
    @IBAction func didTabBuyButton(button: UIButton){
        viewProperties?.didTabBuy()
    }
}
