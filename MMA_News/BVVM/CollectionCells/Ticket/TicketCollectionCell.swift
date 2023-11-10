//
//  TicketCollectionCell.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import UIKit
import Architecture

final class TicketCollectionCell: UICollectionViewCell, ViewProtocol {
    
	struct ViewProperties {
		let ticket: DECTicket
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
		guard let ticket = self.viewProperties?.ticket else { return }
		titleLabel.text = ticket.title
		cityLabel.text = ticket.city
		dateLabel.text = ticket.date.convert(from: .fullData_Time, to: .dayMonthYear)
		timeLabel.text = ticket.date.convert(from: .fullData_Time, to: .time)
	}
	
	private func setPhoto(){
		guard let ticket = self.viewProperties?.ticket else { return }
		let leftUrl = URL(string: ticket.leftPhotoUrl)
		let rightUrl = URL(string: ticket.rightPhotoUrl)
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
		rightImageView.cornerRadius(
			radius: 8,
			direction: .allCorners,
			clipsToBounds: true
		)
		leftImageView.cornerRadius(
			radius: 8,
			direction: .allCorners,
			clipsToBounds: true
		)
	}
	
	//MARK: -
	@IBAction func didTabBuyButton(button: UIButton){
		viewProperties?.didTabBuy()
	}
}
