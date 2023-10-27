//
//  YouTubeScreenViewController.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 05.03.2023.
//
import UIKit
import YouTubePlayerKit
import Architecture

final class YouTubeScreenViewController: UIViewController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let addYouTubeView: Closure<UIView>
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak private var containerYouTubeView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addYouTubeView(containerYouTubeView)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
