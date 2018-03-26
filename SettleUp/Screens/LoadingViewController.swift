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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataService.fetchData { (result) in
            self.handleFetchResult(result)
        }
    }

}

private extension LoadingViewController {

    func handleFetchResult(_ result: Result<[Category]>) {
        switch result {
        case .success(let categories):
            self.delegate?.loadingViewControllerDidFetchCategories(categories)
        case .failure(let error):
            self.handleFailure(error)
        }
    }

    func handleFailure(_ error: Error) {
        typealias Strings = L10n.Loading.ErrorAlert
        let alert = UIAlertController(title: Strings.title, message: Strings.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.retry, style: .default, handler: { _ in
            self.retry(shouldForceReinitialize: false)
        }))
        alert.addAction(UIAlertAction(title: Strings.forceRetry, style: .destructive, handler: { _ in
            self.retry(shouldForceReinitialize: true)
        }))
        alert.addAction(UIAlertAction(title: Strings.cancel, style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    func retry(shouldForceReinitialize: Bool) {
        dataService.fetchData(shouldForceInitialize: shouldForceReinitialize) { result in
            self.handleFetchResult(result)
        }
    }

}
