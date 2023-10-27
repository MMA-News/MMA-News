//
//  Orientation.swift
//  NEWS_MMA
//
//  Created by NEWS_MMA on 01.04.2023.
//

import UIKit

struct Orientation {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
    }
}
