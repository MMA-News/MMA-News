//
//  TicketView.swift
//  MMA_News
//
//  Created by IOS Developer on 09.11.2023.
//
import UIKit
import Architecture

final class TicketView: UIView, ViewProtocol {
    
	struct ViewProperties {
		let ticket: DECTicket
		let didTapClose: ClosureEmpty
	}
	var viewProperties: ViewProperties?
	
	@IBOutlet weak private var titleLabel: UILabel!
	@IBOutlet weak private var cityLabel : UILabel!
	@IBOutlet weak private var dateLabel : UILabel!
	@IBOutlet weak private var timeLabel : UILabel!
	@IBOutlet weak private var qrImageView : UIImageView!
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.setup()
	}
	
	func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		setData()
		//setPhoto()
	}
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		setData()
		//setPhoto()
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
		let qrUrl = URL(string: ticket.qrUrl)
		qrImageView.sd_setImage(with: qrUrl) { _, error, _, url in
			
		}
	}
	
	private func setup(){
		self.cornerRadius(
			corners: .allCorners,
			radius: DesignSystem.Guid.cornerRadius
		)
	}
	
	@IBAction func closeButton(button: UIButton){
		viewProperties?.didTapClose()
	}
}
