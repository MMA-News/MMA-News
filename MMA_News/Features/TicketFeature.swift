//
//  TicketFeature.swift
//  MMA_News
//
//  Created by IOS Developer on 08.11.2023.
//
import Resolver
import Router
import UIKit

struct TicketFeature {
	
	private let homeScreenBuilder = TicketVCBuilder.build()
	private let ticketCollectionViewBuilder = TicketCollectionViewBuilder.build()
	private let getRequestsFirebaseService: GetRequestsFirebaseService = Resolver.resolve()
	private var bannerService = BannerService()
	private let userIdService = UserIdService()
	
	func run(with tabs: TabBarControllersService.Tabs) -> UIViewController {
		let viewProperties = TicketVC.ViewProperties(
			addCollectionView: addCollectionView,
			viewDidAppear: viewDidAppear
		)
		homeScreenBuilder.viewManager.state = .createViewProperties(viewProperties)
		homeScreenBuilder.view.setTabBarImage(with: tabs.image())
		homeScreenBuilder.view.setTabBarTitle(with: tabs.title())
		return homeScreenBuilder.view
	}
	
	private func updateData() {
		getRequestsFirebaseService.getTickets(
			userID: userIdService.get()) { result in
				switch result {
					case .error(let error):
						print(error ?? "")
						self.ticketCollectionViewBuilder.view.isHidden = true
					case .object(let tickets):
						self.ticketCollectionViewBuilder.view.isHidden = (tickets?.isEmpty == true)
						guard let tickets = tickets else { return }
						let ticketsSorted = tickets.sorted(by: { $0.date > $1.date })
						let ticketsVP: [TicketCollectionCell.ViewProperties] = tickets.compactMap { ticket in
							let viewProperties = TicketCollectionCell.ViewProperties(
								ticket: ticket,
								didTabBuy: {
									guard ticket.isPayment else { return }
									let viewConstraints = BannerService.ViewConstraints(
										view: self.createTicketView(with: ticket),
										width: 228,
										height: 300
									)
									self.bannerService.setup(state: .show(viewConstraints))
								})
							return viewProperties
						}
						let viewProperties = TicketCollectionView.ViewProperties(tickets: ticketsVP)
						self.ticketCollectionViewBuilder.viewManager.state = .createViewProperties(viewProperties)
				}
			}
	}
	
	private func viewDidAppear(){
		updateData()
	}
	
	private func addCollectionView(with containerView: UIView) {
		containerView.addSubview(ticketCollectionViewBuilder.view)
		ticketCollectionViewBuilder.view.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		updateData()
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

