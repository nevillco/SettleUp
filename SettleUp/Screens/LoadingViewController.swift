//
//  LoadingViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

protocol LoadingViewControllerDelegate: class {

    func loadingViewControllerDidFetchCategories(_ categories: [Category])

}

final class LoadingViewController: UIViewController {

    fileprivate let dataService = DataService()
    weak var delegate: LoadingViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataService.fetchData { (result) in
            switch result {
            case .success(let categories):
                self.delegate?.loadingViewControllerDidFetchCategories(categories)
            case .failure(let error):
                self.handleFailure(error)
            }
        }
    }

}

private extension LoadingViewController {

    func handleFailure(_ error: Error) {
        print(error.localizedDescription)
    }

}
