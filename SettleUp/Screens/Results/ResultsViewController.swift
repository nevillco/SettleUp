//
//  ResultsViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

final class ResultsViewController: UIViewController {

    fileprivate let results: [SelectionResult]

    init(selections: [Selection]) {
        self.results = ResultService(selections: selections).generateResults()
        print(results.map({ ($0.category.title, $0.rules.map({ $0.id })) }))
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = L10n.Results.title
    }

}
