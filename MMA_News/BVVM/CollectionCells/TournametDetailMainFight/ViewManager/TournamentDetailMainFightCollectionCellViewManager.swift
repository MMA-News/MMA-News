//
//  TournamentDetailMainFightCollectionCellViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import Architecture

final class TournamentDetailMainFightCollectionCellViewManager:  ViewManager<TournamentDetailMainFightCollectionCell> {
    
    // MARK: - DI
    private let tournamentsDetailFeature: TournamentsDetailFeature
    
    init(
        tournamentsDetailFeature: TournamentsDetailFeature
    ) {
        self.tournamentsDetailFeature = tournamentsDetailFeature
    }
    
    //MARK: - implementation protocol
    var viewProperties: TournamentDetailMainFightCollectionCell.ViewProperties?
    
    //MARK: - Main state view manager
    enum State {
        case createViewProperties(DECTournament)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let tournament):
                self.viewProperties = TournamentDetailMainFightCollectionCell.ViewProperties(
                    addActionView: addActionView,
                    tournament: tournament,
                    actionViewIsHide: true
                )
                create?(self.viewProperties)
        }
    }
    
    private func addActionView(with containerView: UIView) {
        let actionButtonViewBuilder = ActionButtonViewBuilder.build()
        let actionButtonViewBuilderView = actionButtonViewBuilder.view
        containerView.addSubview(actionButtonViewBuilderView)
        actionButtonViewBuilderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
        let viewProperties = ActionButtonView.ViewProperties(
            action: { [weak self] in
                self?.tournamentsDetailFeature.didTapBuyTicket()
            },
            title: "Купить билеты".bodySmall(color: .black))
        actionButtonViewBuilder.viewManager.state = .createViewProperties(viewProperties)
    }
}
