//
//  MainNavBarScreenViewController.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Architecture

final class MainNavBarScreenViewController: UINavigationController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let addNavBarView: Closure<UIView>
    }
    var viewProperties: ViewProperties?
    
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
        self.viewProperties?.addNavBarView(self.view)
    }
    
}
