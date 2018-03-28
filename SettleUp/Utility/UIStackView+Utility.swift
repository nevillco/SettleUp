//
//  UIStackView+Utility.swift
//  SettleUp
//
//  Created by Connor Neville on 3/28/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage

extension UIStackView {

    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }

}

extension UIView {

    static func horizontalSpace(_ width: CGFloat) -> UIView {
        let view = UIView()
        view.widthAnchor == width
        return view
    }

    static func verticalSpace(_ height: CGFloat) -> UIView {
        let view = UIView()
        view.heightAnchor == height
        return view
    }

    static func flexibleSpace() -> UIView {
        let view = UIView()
        view.doNotRequireHugging(along: .horizontal)
        view.doNotRequireHugging(along: .vertical)
        return view
    }

}
