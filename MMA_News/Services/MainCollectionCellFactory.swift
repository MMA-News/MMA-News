//
//  MainCollectionCellFactory.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 18.02.2023.
//

import UIKit

struct MainCollectionCellFactory {
    
    var sections: [Section] =
    [
        .mainNewBanner,
        
        .headerMainNew,
        .mainNew,
        
        .headerMedia,
        .mainMedia,
        
        .headerFighters,
        .mainFighters,
		
		.headerTournaments,
		.mainTournaments
    ]
    
    // MARK: - public methods
    
    func size(with collectionView: UICollectionView, with indexPath: IndexPath) -> CGSize {
        let section = createSection(with: indexPath)
        
        switch section {
			case .headerMedia, .headerMainNew, .headerFighters, .headerTournaments:
                let width : CGFloat = (collectionView.bounds.width - 32)
                let height: CGFloat = 62
                return CGSize(width: width, height: height)
            case .mainMedia:
                let width : CGFloat = (collectionView.bounds.width)
                let height: CGFloat = 210
                return CGSize(width: width, height: height)
            case .mainNew:
                let width : CGFloat = (collectionView.bounds.width)
                let height: CGFloat = 210
                return CGSize(width: width, height: height)
            case .mainNewBanner:
                let width : CGFloat = (collectionView.bounds.width)
                let height: CGFloat = 250
                return CGSize(width: width, height: height)
            case .mainFighters:
                let width : CGFloat = (collectionView.bounds.width)
                let height: CGFloat = 330
                return CGSize(width: width, height: height)
			case .mainTournaments:
				let width : CGFloat = (collectionView.bounds.width)
				let height: CGFloat = 330
				return CGSize(width: width, height: height)
            case .none:
                return .zero
        }
    }
    
    func build(with collectionView: UICollectionView, with indexPath: IndexPath) -> UICollectionViewCell {
        let section = createSection(with: indexPath)
        switch section {
            //Banner
            case .mainNewBanner:
                let collectionCellBuilder = MainNewBannerCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                
                collectionCellBuilder.viewManager.state = .createViewProperties
                return collectionCellBuilder.view
                
            //News
            case .headerMainNew:
                
                let collectionCellBuilder = HeaderMainCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                collectionCellBuilder.viewManager.state = .createViewProperties(.news)
                return collectionCellBuilder.view
                
            case .mainNew:
                let collectionCellBuilder = MainCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                
                collectionCellBuilder.viewManager.state = .createViewProperties(.news)
                return collectionCellBuilder.view
                
            //Media
            case .headerMedia:
                let collectionCellBuilder = HeaderMainCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                collectionCellBuilder.viewManager.state = .createViewProperties(.media)
                return collectionCellBuilder.view
                
            case .mainMedia:
                let collectionCellBuilder = MainCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                
                collectionCellBuilder.viewManager.state = .createViewProperties(.media)
                return collectionCellBuilder.view
                
            //Fighters
            case .headerFighters:
                let collectionCellBuilder = HeaderMainCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                collectionCellBuilder.viewManager.state = .createViewProperties(.fighters)
                return collectionCellBuilder.view
                
            case .mainFighters:
                let collectionCellBuilder = MainCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                
                collectionCellBuilder.viewManager.state = .createViewProperties(.fighters)
                return collectionCellBuilder.view
				
			//Tournaments
			case .headerTournaments:
				let collectionCellBuilder = HeaderMainCollectionCellBuilder.build(
					with: collectionView,
					with: indexPath
				)
				collectionCellBuilder.viewManager.state = .createViewProperties(.tournaments)
				return collectionCellBuilder.view
				
			case .mainTournaments:
				let collectionCellBuilder = MainCollectionCellBuilder.build(
					with: collectionView,
					with: indexPath
				)
				
				collectionCellBuilder.viewManager.state = .createViewProperties(.tournaments)
				return collectionCellBuilder.view
                
            default:
                return UICollectionViewCell()
        }
    }
    
    // MARK: - private methods
    
    private func createSection(with indexPath: IndexPath) -> Section {
        let section = sections[indexPath.section]
        return section
    }
    
    
    enum Section {
        case mainMedia
        case mainNew
        case mainNewBanner
		
        case headerMedia
        case headerMainNew
		
        case headerFighters
        case mainFighters
		
		case headerTournaments
		case mainTournaments
        case none
        
        init(indexPath: IndexPath) {
            switch (indexPath.section, indexPath.row) {
                case (0, 0):
                    self = .mainNewBanner
                    
                case (1, 0):
                    self = .headerMainNew
                    
                case (2, 0):
                    self = .mainNew
                    
                case (3, 0):
                    self = .headerMedia
                    
                case (4, 0):
                    self = .mainMedia
                    
                case (5, 0):
                    self = .headerFighters
                    
                case (6, 0):
                    self = .mainFighters
					
				case (7, 0):
					self = .headerTournaments
					
				case (8, 0):
					self = .mainTournaments
                default:
                    self = .none
            }
        }
    }
}
