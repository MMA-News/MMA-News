//
//  MainNavBarScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Foundation
import Architecture
import UIKit

final class MainNavBarScreenViewManager: ViewManager<MainNavBarScreenViewController> {
    
    var viewProperties: MainNavBarScreenViewController.ViewProperties?
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = MainNavBarScreenViewController.ViewProperties(
                    addNavBarView: addAndCreateNavBarView
                )
                create?(viewProperties)
        }
    }
    private func addAndCreateNavBarView(with containerView: UIView) {
        let navBarBuilder = NavBarViewBuilder.build()
        navBarBuilder.viewManager.state = .createViewProperties
        let navBarView = navBarBuilder.view
        let safeAreaInsetsTop = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        containerView.addSubview(navBarView)
        navBarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(safeAreaInsetsTop)
            $0.left.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        let safeAreaTopView = UIView()
		safeAreaTopView.backgroundColor = DesignSystem.Color.mainBlue
        navBarView.backgroundColor = DesignSystem.Color.mainBlue
        containerView.addSubview(safeAreaTopView)
        safeAreaTopView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(navBarView.snp.top)
        }
    }
}
