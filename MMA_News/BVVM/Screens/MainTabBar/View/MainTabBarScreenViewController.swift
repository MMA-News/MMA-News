//
//  MainTabBarScreenViewController.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import UIKit
import Combine
import Architecture

final class MainTabBarScreenViewController: UITabBarController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let viewControllers: [UIViewController]
        let tabBarDelegate: UITabBarControllerDelegate
        let setupTabBarController: Closure<UITabBarController>
    }
    var viewProperties: ViewProperties?
    
    private var anyCancel: Set<AnyCancellable> = []
    
    //MARK: - Outlets
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setViewControllers()
        setTabBarDelegate()
        setupTabBar()
        viewProperties?.setupTabBarController(self)
    }
    
    private func setViewControllers(){
        setViewControllers(viewProperties?.viewControllers, animated: true)
    }
    
    private func setupTabBar(){
        tabBar.backgroundColor = DesignSystem.Color.mainBlue
        tabBar.barTintColor = DesignSystem.Color.mainBlue
        tabBar.tintColor = DesignSystem.Color.yellow900
        tabBar.isTranslucent = false
    }
    
    private func setTabBarDelegate(){
        guard let tabBarDelegate = viewProperties?.tabBarDelegate else { return }
        self.delegate = tabBarDelegate
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
