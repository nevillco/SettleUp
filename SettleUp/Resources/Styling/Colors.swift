//
//  Colors.swift
//  SettleUp
//
//  Created by Connor Neville on 4/12/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

extension UIColor {

    static let brandAqua = UIColor(hueDegrees: 180, saturation: 1, brightness: 0.8)

}

extension UIColor {

    convenience init(hueDegrees: Int, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat = 1) {
        let hue = CGFloat(hueDegrees) / 360.0
        self.init(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }

}
