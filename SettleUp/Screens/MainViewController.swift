//
//  MainViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    fileprivate let categories: [Category]
    fileprivate let nav = UINavigationController()

    init(categories: [Category]) {
        self.categories = categories
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(nav)
    }

}
