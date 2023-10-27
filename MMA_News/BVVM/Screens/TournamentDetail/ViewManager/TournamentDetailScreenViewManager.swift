//
//  TournamentDetailScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 28.02.2023.
//
import UIKit
import Architecture

final class TournamentDetailScreenViewManager: ViewManager<TournamentDetailScreenViewController> {
    
    var viewProperties: TournamentDetailScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    private var tournamentDetailCollectionViewManager: TournamentDetailCollectionViewManager?
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties(DECTournament)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties(let tournament):
                self.viewProperties = TournamentDetailScreenViewController.ViewProperties(
                    addTournamentDetailCollectionView: addAndCreateTournamentDetailCollectionView
                )
                create?(self.viewProperties)
                self.tournamentDetailCollectionViewManager?.state = .createViewProperties(tournament)
        }
    }
    
    private func addAndCreateTournamentDetailCollectionView(with containerView: UIView) {
        let tournamentDetailCollectionViewBuilder = TournamentDetailCollectionViewBuilder.build()
        let tournamentDetailCollectionView = tournamentDetailCollectionViewBuilder.view
        containerView.addSubview(tournamentDetailCollectionView)
        tournamentDetailCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.tournamentDetailCollectionViewManager = tournamentDetailCollectionViewBuilder.viewManager
    }
}
