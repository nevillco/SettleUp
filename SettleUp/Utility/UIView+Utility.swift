//
//  UIView+Utility.swift
//  SettleUp
//
//  Created by Connor Neville on 3/28/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

extension UIView {

    func doNotRequireHugging(along axis: UILayoutConstraintAxis) {
        setContentHuggingPriority(.defaultLow, for: axis)
    }

    func requireHugging(along axis: UILayoutConstraintAxis) {
        setContentHuggingPriority(.required, for: axis)
    }

    func allowCompression(along axis: UILayoutConstraintAxis) {
        setContentCompressionResistancePriority(.defaultLow, for: axis)
    }

    func preventCompression(along axis: UILayoutConstraintAxis) {
        setContentCompressionResistancePriority(.required, for: axis)
    }

}
