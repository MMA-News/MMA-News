//
//  PostCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import UIKit
import Architecture

final class PostCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let postText: String
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var postLabel: UILabel!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setPost()
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setPost()
    }
    
    private func setPost(){
        guard let viewProperties = viewProperties else { return }
        postLabel.attributedText = viewProperties.postText.H316(color: .white)
    }
}
