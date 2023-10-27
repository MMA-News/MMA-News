//
//  HomeCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 04.02.2023.
//
import UIKit
import Architecture

final class HomeCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
