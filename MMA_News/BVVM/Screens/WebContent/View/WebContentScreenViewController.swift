//
//  WebContentScreenViewController.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import WebKit
import Architecture

final class WebContentScreenViewController: UIViewController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let urlString: String
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak private var webView: WKWebView!
    
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setupWebView()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setupWebView()
    }
    
    private func setupWebView(){
        guard let urlString = self.viewProperties?.urlString else { return }
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
