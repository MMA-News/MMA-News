//
//  MainTabBarScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import UIKit
import Router
import Architecture

final class MainTabBarScreenViewManager: ViewManager<MainTabBarScreenViewController> {
    
    // MARK: - DI -
    
    private let tabBarControllersService: TabBarControllersService
    private let routerService: RouterService

    init(
        tabBarControllersService: TabBarControllersService,
        routerService: RouterService
    ) {
        self.tabBarControllersService = tabBarControllersService
        self.routerService = routerService
    }
    
    var viewProperties: MainTabBarScreenViewController.ViewProperties?
    
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
                viewProperties = MainTabBarScreenViewController.ViewProperties(
                    viewControllers: createViewControllers(),
                    tabBarDelegate: TabBarDelegate(),
                    setupTabBarController: setupTabBarController
                )
                create?(viewProperties)
        }
    }
    
    private func createViewControllers() -> [UIViewController]{
        let viewControllers = tabBarControllersService.createViewControllers()
        return viewControllers
    }
    
    private func setupTabBarController(with tabBarController: UITabBarController){
        routerService.setupTabBarControllerVC(with: tabBarController)
    }
}

final class TabBarDelegate: NSObject, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(viewController)
    }
}
