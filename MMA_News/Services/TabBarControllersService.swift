//
//  TabBarControllersService.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//

import UIKit

struct TabBarControllersService {
    
    private let currentTabs: [Tabs] = [.main, .news, .fighters, .tournaments]
    
    func createViewControllers() -> [UIViewController]{
        let viewControllers: [UIViewController] = currentTabs.map({
            $0.create()
        })
        return viewControllers
    }
}

private extension TabBarControllersService {
    
     enum Tabs: String, CaseIterable {
        case main
        case news
        case fighters
        case tournaments
        case home
        
        func create() -> UIViewController {
            switch self {
                    
                case .main:
                    let mainScreenBuilder = MainScreenViewControllerBuilder.build()
                    mainScreenBuilder.viewManager.state = .createViewProperties
                    mainScreenBuilder.view.setTabBarImage(with: self.image())
                    mainScreenBuilder.view.setTabBarTitle(with: self.title())
                    return mainScreenBuilder.view
                    
                case .news:
                    let newsScreenBuilder = NewsScreenViewControllerBuilder.build()
                    newsScreenBuilder.viewManager.state = .createViewProperties
                    newsScreenBuilder.view.setTabBarImage(with: self.image())
                    newsScreenBuilder.view.setTabBarTitle(with: self.title())
                    return newsScreenBuilder.view
                    
                case .fighters:
                    let fightersScreenBuilder = FightersScreenViewControllerBuilder.build()
                    fightersScreenBuilder.viewManager.state = .createViewProperties
                    fightersScreenBuilder.view.setTabBarImage(with: self.image())
                    fightersScreenBuilder.view.setTabBarTitle(with: self.title())
                    return fightersScreenBuilder.view
                    
                case .tournaments:
                    let tournamentsScreenBuilder = TournamentsScreenViewControllerBuilder.build()
                    tournamentsScreenBuilder.viewManager.state = .createViewProperties
                    tournamentsScreenBuilder.view.setTabBarImage(with: self.image())
                    tournamentsScreenBuilder.view.setTabBarTitle(with: self.title())
                    return tournamentsScreenBuilder.view
                    
                case .home:
                    let homeScreenBuilder = HomeScreenViewControllerBuilder.build()
                    homeScreenBuilder.viewManager.state = .createViewProperties
                    homeScreenBuilder.view.setTabBarImage(with: self.image())
                    homeScreenBuilder.view.setTabBarTitle(with: self.title())
                    return homeScreenBuilder.view
            }
        }
        
        func title() -> String {
            switch self {
                case .main:
                    return "Главный"
                    
                case .home:
                    return "Дом"
                    
                case .news:
                    return "Новости"
                    
                case .fighters:
                    return "Бойцы"
                    
                case .tournaments:
                    return "Турниры"
            }
        }
        
        func image() -> UIImage {
            return UIImage(named: self.rawValue) ?? UIImage()
        }
    }
}
