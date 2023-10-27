//
//  FightersCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Architecture

final class FightersCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
       
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    
    }
    
    private func setup(){
        self.cornerRadius(
            corners: .allCorners,
            radius: DesignSystem.Guid.cornerRadius
        )
    }
}
