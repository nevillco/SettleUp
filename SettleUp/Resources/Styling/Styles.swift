//
//  Styles.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import BonMot

extension StringStyle {

    static let nav = StringStyle(
        .font(Lato.regular.ofSize(28))
    )
    static let h1 = StringStyle(
        .font(Lato.regular.ofSize(24))
    )
    private static let boldBody = StringStyle(
        .font(Lato.regular.ofSize(16))
    )
    static let body = StringStyle(
        .font(Lato.light.ofSize(16)),
        .xmlRules([.style("b", boldBody)])
    )
    static let note = StringStyle(
        .font(Lato.light.ofSize(14))
    )
    static let counter = StringStyle(
        .font(Menlo.regular.ofSize(20)),
        .alignment(.center)
    )
    static let cta = StringStyle(
        .font(Lato.regular.ofSize(36)),
        .color(.brandAqua)
    )
    static let smallButton = StringStyle(
        .font(Lato.bold.ofSize(16))
    )

}
