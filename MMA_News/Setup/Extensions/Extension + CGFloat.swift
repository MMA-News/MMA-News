//
//  Extension + CGFloat.swift
//  DG.BET
//
//  Created by -=ALEKSANDR=- on 01/September/2019.
//  Copyright © 2019 -=ALEKSANDR=-. All rights reserved.
//
import Foundation

import UIKit
//1° × π/180 = 0,01745 рад
extension CGFloat {
  static func radians(gr: CGFloat) -> CGFloat {
    let result = gr * (CGFloat.pi / 180)
    return result
  }
}
