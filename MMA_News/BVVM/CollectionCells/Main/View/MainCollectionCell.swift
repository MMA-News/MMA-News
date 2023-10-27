//
//  MainCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 17.02.2023.
//
import UIKit
import Architecture

final class MainCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let addView: Closure<UIView>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var containerView: UIView!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        viewProperties?.addView(containerView)
    }
}
