//
//  LoadedViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import BonMot

final class LoadedViewController: UIViewController {

    fileprivate let categories: [Category]
    fileprivate let navController: UINavigationController

    init(categories: [Category]) {
        self.categories = categories
        let homeController = HomeViewController(categories: categories)
        self.navController = UINavigationController(rootViewController: homeController)
        super.init(nibName: nil, bundle: nil)
        homeController.delegate = self
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(navController)
    }

}

extension LoadedViewController: HomeViewControllerDelegate {

    func homeViewController(_ vc: HomeViewController, didNotify action: HomeViewController.Action) {
        switch action {
        case .didTapPlay:
            let results = ResultsViewController(categories: categories)
            navController.pushViewController(results, animated: true)
        }
    }

}
