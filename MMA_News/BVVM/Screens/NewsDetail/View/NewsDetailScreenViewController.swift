//
//  NewsDetailScreenViewController.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 16.02.2023.
//
import UIKit
import SkeletonView
import Architecture

final class NewsDetailScreenViewController: UIViewController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let addProgressView : Closure<UIView>
        let addActionView   : Closure<UIView>
        let news            : DECNew
        var timeStart       : String
        var actionViewIsHide: Bool
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak private var containerProgressView: UIView!
    @IBOutlet weak private var containerActionView  : UIView!
    @IBOutlet weak private var titleNewsLabel       : UILabel!
    @IBOutlet weak private var timeStartLabel       : UILabel!
    @IBOutlet weak private var cityNewsLabel        : UILabel!
    @IBOutlet weak private var dateNewsLabel        : UILabel!
    @IBOutlet weak private var postNewsLabel        : UILabel!
    @IBOutlet weak private var postImageView        : UIImageView!
    @IBOutlet weak private var blurImageView        : UIImageView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData()
        setImageData()
        setupActionView()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addProgressView(containerProgressView)
        self.viewProperties?.addActionView(containerActionView)
        setData()
        setImageData()
    }
    
    private func setData(){
        guard let news = self.viewProperties?.news else { return }
        titleNewsLabel.attributedText = news.title.H2(color: .white)
        cityNewsLabel.attributedText  = news.city?.body14(color: .white)
        postNewsLabel.attributedText  = news.post.body14(color: .white)
        timeStartLabel.attributedText = self.viewProperties?.timeStart.body12(color: .white)
        dateNewsLabel.attributedText = news.date.body14(color: .white)
    }
    
    private func setImageData() {
        guard let news = self.viewProperties?.news else { return }
        SkeletonService.shared.action(
            state: .show([postImageView], [DesignSystem.Color.background, DesignSystem.Color.grayNight700])
        )
        let url = URL(string: news.photoURL)
        postImageView.sd_setImage(with: url) { [weak self] (_, error, _, _) in
            guard let self = self else { return }
            SkeletonService.shared.action(
                state: .hide([self.postImageView])
            )
        }
        blurImageView.sd_setImage(with: url)
    }
    
    private func setupActionView(){
        guard let actionViewIsHide = self.viewProperties?.actionViewIsHide else { return }
        containerActionView.isHidden = actionViewIsHide
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
