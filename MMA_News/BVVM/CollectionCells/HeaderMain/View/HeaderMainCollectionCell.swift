//
//  HeaderMainCollectionCell.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//
import UIKit
import Architecture

final class HeaderMainCollectionCell: UICollectionViewCell, ViewProtocol {
    
    struct ViewProperties {
        let headerMainCollectionType: HeaderMainCollectionType
        let didTapMore: Closure<HeaderMainCollectionType>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak private var actionButton: UIButton!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData(with: viewProperties)
    }
    
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        setData(with: viewProperties)
    }
    
    private func setData(with viewProperties: ViewProperties?){
        textLabel.attributedText = viewProperties?.headerMainCollectionType.title()
    }
    
    @IBAction func didTapMoreButton(button: UIButton){
        guard let headerMainCollectionType = viewProperties?.headerMainCollectionType else { return }
        viewProperties?.didTapMore(headerMainCollectionType)
    }
}

enum HeaderMainCollectionType {
    
    case news
    case media
    case fighters
	case tournaments
    
    func title() -> NSAttributedString  {
        switch self {
            case .news:
                let attributedString = Strings
                    .mainNews
                    .H2(color: .white)
                return attributedString
                
            case .media:
                let attributedString = Strings
                    .media
                    .H2(color: .white)
                return attributedString
                
            case .fighters:
                let attributedString = Strings
                    .fighters
                    .H2(color: .white)
                return attributedString
				
			case .tournaments:
				let attributedString = Strings
					.tournaments
					.H2(color: .white)
				return attributedString
        }
    }
}
