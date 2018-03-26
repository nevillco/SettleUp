//
//  LoadedViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

final class LoadedViewController: UIViewController {

    fileprivate let categories: [Category]
    fileprivate let homeController: HomeViewController
    fileprivate let navController: UINavigationController

    init(categories: [Category]) {
        self.categories = categories
        self.homeController = HomeViewController(categories: categories)
        self.navController = UINavigationController(rootViewController: homeController)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(navController)
    }

}
