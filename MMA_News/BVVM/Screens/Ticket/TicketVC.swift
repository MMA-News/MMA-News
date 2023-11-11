//
//  TicketVC.swift
//  MMA_News
//
//  Created by Senior Developer on 08.11.2023.
//
import UIKit
import Architecture

final class TicketVC: UIViewController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
		let addCollectionView: Closure<UIView>
		let viewDidAppear: ClosureEmpty
    }
    var viewProperties: ViewProperties?
	
	//MARK: - Outlets
	@IBOutlet weak private var containerCollectionView: UIView!
	
	init() {
		super.init(nibName: String(describing: Self.self), bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
    
    //MARK: - Outlets
    
    
    //MARK: - LifeCycle
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.viewProperties?.viewDidAppear()
	}
    
	//MARK: - public methods
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.viewProperties?.addCollectionView(containerCollectionView)
    }
}
