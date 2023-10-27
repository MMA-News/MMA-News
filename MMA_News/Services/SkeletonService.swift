//
//  SkeletonService.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.03.2023.
//
import SkeletonView
import UIKit

struct SkeletonService {
    
    static let shared = SkeletonService()
    
    public func action(state: State){
        switch state {
            case .hide(let views):
                hide(views)
                
            case .show(let views, let colors):
                show(views, colors: colors)
        }
    }
    
    private func colors() -> [UIColor] {
        let baseColors = [DesignSystem.Color.background, DesignSystem.Color.grayNight700]
        return baseColors
    }
    
    private func show(_ views: [UIView], colors: [UIColor]) {
        views.forEach({
            $0.isSkeletonable = true
            $0.showAnimatedGradientSkeleton(usingGradient: .init(colors: colors))
        })
    }
    
    private func hide(_ views: [UIView]) {
        views.forEach({ $0.hideSkeleton() })
    }
    
    enum State {
        case show([UIView], [UIColor])
        case hide([UIView])
    }
    
    private init() {}
}
