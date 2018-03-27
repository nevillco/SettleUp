//
//  CustomFont.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

protocol CustomFont: RawRepresentable { }

extension CustomFont where RawValue == String {

    func ofSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: rawValue, size: size)!
    }

}

enum Lato: String, CustomFont {
    case black = "Lato-Black"
    case bold = "Lato-Bold"
    case hairline = "Lato-Hairline"
    case light = "Lato-Light"
    case regular = "Lato-Regular"
}

enum Menlo: String, CustomFont {
    case bold = "Menlo-Bold"
    case regular = "Menlo-Regular"
}
