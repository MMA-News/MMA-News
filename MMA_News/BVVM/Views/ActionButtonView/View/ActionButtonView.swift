//
//  ActionButtonView.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.03.2023.
//
import UIKit
import Architecture

final class ActionButtonView: UIView, ViewProtocol {
    
    struct ViewProperties {
        let action: ClosureEmpty
        let title: NSAttributedString
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var button: UIButton!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setup()
    }
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setup()
    }
    
    private func setup(){
        button.setAttributedTitle(viewProperties?.title, for: .normal)
        self.cornerRadius(radius: 8,
                          direction: .allCorners,
                          clipsToBounds: true)
        button.cornerRadius(radius: 8,
                          direction: .allCorners,
                          clipsToBounds: true)
    }
    
    //MARK: -
    @IBAction func actionButton(button: UIButton){
        viewProperties?.action()
    }
}
