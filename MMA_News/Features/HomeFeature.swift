//
//  HomeFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//

import Foundation

final class HomeFeature: BaseFeatureService<HomeFeature> {
    
    override func currentService() -> Self? {
        return self
    }
}

enum HomeURLs: String, CaseIterable {
    
    case hfc = "https://hardcorefc.ru/"
    case nashedelofigh = "https://nashedelofight.ru/"
}
