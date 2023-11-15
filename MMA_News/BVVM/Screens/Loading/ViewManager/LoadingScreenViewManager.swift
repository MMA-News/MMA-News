//
//  LoadingScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import Router
import UIKit
import Architecture
import FirebaseFirestore
import RoboKassaSDK
import Combine

final class LoadingScreenViewManager: ViewManager<LoadingScreenViewController> {
    
    var viewProperties: LoadingScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    
    private var mainTabBarScreenViewManager: MainTabBarScreenViewManager?
    private var anyCancel: Set<AnyCancellable> = []
    private var timer: Timer?
    private let reference = Firestore.firestore()
    
    // MARK: - DI -
    private let routerService: RouterService
	private let roboKassaFeature = RoboKassaFeature()
    
    init(
        routerService: RouterService
    ) {
        self.routerService = routerService
    }
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties
        case updateViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = LoadingScreenViewController.ViewProperties(
                    progressValue: 0,
                    didAppear: didAppear
                )
                create?(viewProperties)
                setupProgress()
        case .updateViewProperties:
            self.update?(viewProperties)
        }
    }
    
    private func didAppear(){
		presentTabBar()
    }
	
	private func setupProgress(){
		self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
			guard let self = self else { return }
			self.viewProperties?.progressValue += 0.005
			self.state = .updateViewProperties
			guard let progressValue = self.viewProperties?.progressValue else { return }
			guard progressValue > 1 else { return }
			self.viewProperties?.progressValue = 0
			self.state = .updateViewProperties
		}
	}
	
	private func presentRoboKassaPayment(with viewController: UIViewController){
		Orientation.lockOrientation(.all)
		self.timer?.invalidate()
		self.timer = nil
		self.routerService.present(
			with: .viewController(viewController),
			animation: true,
			transitionStyle: .coverVertical,
			presentationStyle: .formSheet
		)
	}
	
    private func presentTabBar(){
        Orientation.lockOrientation(.portrait)
        //TabBar
        let mainTabBarBuilder = MainTabBarScreenViewControllerBuilder.build()
        mainTabBarScreenViewManager = mainTabBarBuilder.viewManager
        mainTabBarScreenViewManager?.state = .createViewProperties
        //NavBar
        let mainNavBarBuilder = MainNavBarScreenViewControllerBuilder.build(
            with: mainTabBarBuilder.view
        )
        mainNavBarBuilder.viewManager.state = .createViewProperties
        routerService.setupNavigationVC(
            with: mainNavBarBuilder.view
        )
        //Set root vc
        routerService.present(
            with: .viewController(mainNavBarBuilder.view)
        )
    }
}
