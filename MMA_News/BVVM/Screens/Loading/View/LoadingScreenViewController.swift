//
//  LoadingScreenViewController.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import UIKit
import Architecture

final class LoadingScreenViewController: UIViewController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        var progressValue: Float
        var didAppear: ClosureEmpty
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak private var progressView: UIProgressView!
    
    //MARK: - LifeCycle
       override func viewDidLoad() {
           super.viewDidLoad()
           setupProgress()
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewProperties?.didAppear()
    }
    
    func update(with viewProperties: ViewProperties?) {
            self.viewProperties = viewProperties
            setProgress()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    private func setProgress(){
        guard let progressValue = self.viewProperties?.progressValue else { return }
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = progressValue
        }
        
    }
    
    private func setupProgress(){
        progressView.cornerRadius(
            radius: 5,
            direction: .allCorners,
            clipsToBounds: true
        )
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
