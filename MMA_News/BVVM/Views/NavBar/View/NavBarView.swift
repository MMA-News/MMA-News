//
//  NavBarView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import UIKit
import Architecture

final class NavBarView: UIView, ViewProtocol {
    
    struct ViewProperties {
        var isHiddenButton: Bool
        let didTapBack: ClosureEmpty
    }
    
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var backButton: UIButton!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        hiddenButton()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        hiddenButton()
    }
    
    private func hiddenButton(){
        guard let isHidden = self.viewProperties?.isHiddenButton else { return }
        backButton.isHidden = isHidden
    }
    
    @IBAction func backButton(button: UIButton){
        self.viewProperties?.didTapBack()
    }
}
