//
//  NavBarFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//

import Foundation

final class NavBarFeature: BaseFeatureService<NavBarFeature> {
    
    public var isHiddenButton: Bool = true
    
    override func currentService() -> Self? {
        return self
    }
    
    func hiddenBackButton(isHidden: Bool){
        isHiddenButton = isHidden
        notifySubscribers()
    }
}
