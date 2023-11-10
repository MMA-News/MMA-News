//
//  TicketFeature.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import Router
import UIKit

struct TicketFeature {
	
	private let homeScreenBuilder = TicketVCBuilder.build()
	private let ticketCollectionViewBuilder = TicketCollectionViewBuilder.build()
	private var bannerService = BannerService()
	
	func run(with tabs: TabBarControllersService.Tabs) -> UIViewController {
		let viewProperties = TicketVC.ViewProperties(addCollectionView: addCollectionView)
		homeScreenBuilder.viewManager.state = .createViewProperties(viewProperties)
		homeScreenBuilder.view.setTabBarImage(with: tabs.image())
		homeScreenBuilder.view.setTabBarTitle(with: tabs.title())
		return homeScreenBuilder.view
	}
	
	private func addCollectionView(with containerView: UIView) {
		let viewProperties = TicketCollectionView.ViewProperties(tickets: createTickets())
		containerView.addSubview(ticketCollectionViewBuilder.view)
		ticketCollectionViewBuilder.view.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		ticketCollectionViewBuilder.viewManager.state = .createViewProperties(viewProperties)
	}
	
	private func createTickets() -> [TicketCollectionCell.ViewProperties] {
		let ticket = DECTicket(
			date: "18.02.23",
			leftPhotoUrl: "",
			rightPhotoUrl: "",
			photoURL: "",
			city: "Москва",
			title: "Махачев Нурмагомедов",
			qrUrl: "",
			pairs: []
		)
		let tickets: [TicketCollectionCell.ViewProperties] = [
			
			TicketCollectionCell.ViewProperties(ticket: ticket, didTabBuy: {
				let viewConstraints = BannerService.ViewConstraints(
					view: self.createTicketView(with: ticket),
					width: 228,
					height: 300
				)
				self.bannerService.setup(state: .show(viewConstraints))
			})
		]
		return tickets
	}
	
	
	private func createTicketView(with ticket: DECTicket) -> UIView {
		let viewProperties = TicketView.ViewProperties(
			ticket: ticket,
			didTapClose: {
				self.bannerService.setup(state: .hide)
			})
		let ticketViewBuilder = TicketViewBuilder.build()
		ticketViewBuilder.viewManager.state = .createViewProperties(viewProperties)
		
		return ticketViewBuilder.view
	}
	
}

