//
//  TournamentsScreenViewController.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Architecture

final class TournamentsScreenViewController: UIViewController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let addCollectionView: Closure<UIView>
        let viewDidAppear: ClosureEmpty
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak private var containerCollectionView: UIView!
    
    
    //MARK: - LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewProperties?.viewDidAppear()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addCollectionView(containerCollectionView)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
