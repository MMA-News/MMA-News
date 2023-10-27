//
//  TournamentDetailCollection.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//

import UIKit

enum TournamentDetailCollection {
    case main(DECTournament)
    case pairs([DECPair])
    case media(DECTournament)
    case post(DECTournament)
    
    func cell(
        collectionView: UICollectionView,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        switch self {
            case .main(let tournament):
                let collectionCellBuilder = TournamentDetailMainFightCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                collectionCellBuilder.viewManager.state = .createViewProperties(tournament)
                cell = collectionCellBuilder.view
                
            case .pairs(let pairs):
                let collectionCellBuilder = FightPairsCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                let pair = pairs[indexPath.row]
                collectionCellBuilder.viewManager.state = .createViewProperties(pair)
                cell = collectionCellBuilder.view
                
            case .post(let tournament):
                let collectionCellBuilder = PostCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                collectionCellBuilder.viewManager.state = .createViewProperties(tournament.post)
                cell = collectionCellBuilder.view
                
            case .media(let tournament):
                let collectionCellBuilder = MediaCollectionCellBuilder.build(
                    with: collectionView,
                    with: indexPath
                )
                let media = DECMedia(
                    date: tournament.date,
                    photoURL: tournament.photoURL,
                    videoURL: "",
                    title: tournament.title
                )
                collectionCellBuilder.viewManager.state = .createViewProperties(media)
                cell = collectionCellBuilder.view
        }
        return cell
    }
    
    func height(indexPath: IndexPath) -> CGFloat {
        
        switch self {
            case .main:
                return 310
                
            case .pairs:
                return 90
                
            case .post:
                return 400
                
            case .media:
                return 248
        }
    }
    
    func rows() -> Int {
        
        switch self {
            case .main:
                return 1
                
            case .pairs(let pairs):
                return pairs.count
                
            case .post:
                return 1
                
            case .media:
                return 1
        }
    }
    
    func insets() -> UIEdgeInsets {
        
        switch self {
            case .main:
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                
            case .pairs:
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                
            case .post:
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                
            case .media:
                return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        }
    }
}

extension TournamentDetailCollection: RawRepresentable {
    
    var rawValue: Int {
        switch self {
            case .main:
                return 0
            case .pairs:
                return 1
            case .post:
                return 2
            case .media:
                return 3
        }
    }
    
    init?(rawValue: Int, tournament: DECTournament) {
        switch rawValue {
            case 0:
                self = .main(tournament)
            case 1:
                self = .pairs(tournament.pairs ?? [])
            case 2:
                self = .post(tournament)
            case 3:
                self = .media(tournament)
            default:
                return nil
        }
    }
    
    init?(rawValue: Int) {
        return nil
    }
}
