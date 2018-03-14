//
//  AppDelegate.swift
//  SettleUp
//
//  Created by Connor Neville on 3/14/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureWindow()
        return true
    }

}

private extension AppDelegate {

    func configureWindow() {
        let window = UIWindow()
        window.backgroundColor = .white
        window.rootViewController = RootViewController()
        window.makeKeyAndVisible()
        self.window = window
    }

}
