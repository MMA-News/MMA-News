//
//  TournamentDetailMainFightCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Architecture

final class TournamentDetailMainFightCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let addActionView: Closure<UIView>
        let tournament: DECTournament
        let actionViewIsHide: Bool
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var containerActionView  : UIView!
    @IBOutlet weak private var titleTournamentsLabel: UILabel!
    @IBOutlet weak private var cityTournamentsLabel : UILabel!
    @IBOutlet weak private var dateTournamentsLabel : UILabel!
    @IBOutlet weak private var timeTournamentsLabel : UILabel!
    @IBOutlet weak private var leftImageView        : UIImageView!
    @IBOutlet weak private var rightImageView       : UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = rightImageView.bounds.width / 2
        leftImageView.cornerRadius(
            radius: radius,
            direction: .allCorners,
            clipsToBounds: true
        )
        rightImageView.cornerRadius(
            radius: radius,
            direction: .allCorners,
            clipsToBounds: true
        )
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData()
        setImageData()
        setupActionView()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addActionView(containerActionView)
        setData()
        setImageData()
        setupActionView()
    }
    
    private func setData(){
        guard let tournament = self.viewProperties?.tournament else { return }
        titleTournamentsLabel.attributedText = tournament.title.H2(color: .white)
        cityTournamentsLabel.attributedText  = tournament
            .city?
            .body14(color: .white)
        dateTournamentsLabel.attributedText  = tournament
            .date
            .convert(from: .fullData_Time,
                     to: .dayMonthYear)?
            .body14(color: .white)
        
        timeTournamentsLabel.attributedText  = tournament
            .date
            .convert(from: .fullData_Time,
                     to: .time)?
            .body14(color: .white)
    }
    
    private func setImageData() {
        guard let tournament = self.viewProperties?.tournament else { return }
        SkeletonService.shared.action(
            state: .show([leftImageView, rightImageView], [DesignSystem.Color.background, DesignSystem.Color.grayNight700])
        )
        
        let leftPhotoUrl  = URL(string: tournament.leftPhotoUrl)
        let rightPhotoUrl = URL(string: tournament.rightPhotoUrl)
        leftImageView.sd_setImage(with: leftPhotoUrl, placeholderImage: .set(.fighterPreview)) { [weak self] (_, error, _, url) in
            guard let self = self else { return }
            SkeletonService.shared.action(
                state: .hide([self.leftImageView])
            )
        }
        rightImageView.sd_setImage(with: rightPhotoUrl, placeholderImage: .set(.fighterPreview)) { [weak self] (_, error, _, url) in
            guard let self = self else { return }
            SkeletonService.shared.action(
                state: .hide([self.rightImageView])
            )
        }
        layoutIfNeeded()
    }
    
    private func setupActionView(){
        guard let actionViewIsHide = self.viewProperties?.actionViewIsHide else { return }
        containerActionView.isHidden = actionViewIsHide
    }
}
