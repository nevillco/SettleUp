//
//  UIAppearance+Defaults.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import BonMot

extension AppDelegate {

    func configureAppearance() {
        let navigationProxy = UINavigationBar.appearance()
        navigationProxy.titleTextAttributes = StringStyle.nav.attributes
    }

}
