//
//  FightPairsCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Architecture

final class FightPairsCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let pair: DECPair
        var leftPairOfFighter: DECPairOfFighter?
        var rightPairOfFighter: DECPairOfFighter?
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var leftImageView      : UIImageView!
    @IBOutlet weak private var rightImageView     : UIImageView!
    @IBOutlet weak private var leftNameLabel      : UILabel!
    @IBOutlet weak private var rightNameLabel     : UILabel!
    @IBOutlet weak private var leftWeightLabel    : UILabel!
    @IBOutlet weak private var rightWeightLabel   : UILabel!
    @IBOutlet weak private var leftFightersLabel  : UILabel!
    @IBOutlet weak private var rightFightersLabel : UILabel!
    @IBOutlet weak private var resultLabel        : UILabel!
    @IBOutlet weak private var roundLabel         : UILabel!
    @IBOutlet weak private var timeLabel          : UILabel!
    
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
        self.cornerRadius(
            radius: 8,
            direction: .allCorners,
            clipsToBounds: true
        )
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setData(with: viewProperties)
        self.setLeftPairOfFighter(with: viewProperties)
        self.setRightPairOfFighter(with: viewProperties)
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setData(with: viewProperties)
        self.setLeftPairOfFighter(with: viewProperties)
        self.setRightPairOfFighter(with: viewProperties)
        layoutIfNeeded()
    }
    
    private func setData(with viewProperties: ViewProperties?){
        guard let viewProperties = viewProperties else { return }
        resultLabel.attributedText = viewProperties.pair.results.body12(color: .white)
        roundLabel.attributedText = viewProperties.pair.round.body10(color: .white)
        timeLabel.attributedText = viewProperties.pair.time.body10(color: .white)
    }
    
    private func setLeftPairOfFighter(with viewProperties: ViewProperties?){
        guard let leftPairOfFighter = viewProperties?.leftPairOfFighter else { return }
        leftNameLabel.attributedText = leftPairOfFighter.firstName.H316(color: .white)
        leftWeightLabel.attributedText = leftPairOfFighter.weight.H316(color: .white)
        leftFightersLabel.attributedText = leftPairOfFighter.fights.H316(color: .white)
    }
    
    private func setRightPairOfFighter(with viewProperties: ViewProperties?){
        guard let rightPairOfFighter = viewProperties?.rightPairOfFighter else { return }
        rightNameLabel.attributedText = rightPairOfFighter.firstName.H316(color: .white)
        rightWeightLabel.attributedText = rightPairOfFighter.weight.H316(color: .white)
        rightFightersLabel.attributedText = rightPairOfFighter.fights.H316(color: .white)
    }
}
