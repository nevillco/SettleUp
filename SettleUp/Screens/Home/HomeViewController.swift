//
//  HomeViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage
import Reusable
import Then

final class HomeViewController: UIViewController {

    fileprivate let categories: [Category]
    fileprivate let tableView = UITableView().then {
        $0.rowHeight = UITableViewAutomaticDimension
        $0.estimatedRowHeight = 200
        $0.separatorStyle = .none
    }
    fileprivate var childControllers: [Int: UIViewController] = [:]

    init(categories: [Category]) {
        self.categories = categories
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.Home.title

        tableView.register(cellType: ReuseNotifyingCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.edgeAnchors == edgeAnchors
    }

}

extension HomeViewController: UITableViewDelegate { }

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReuseNotifyingCell = tableView.dequeueReusableCell(for: indexPath)
        cell.delegate = self
        cell.indexPath = indexPath
        cell.selectionStyle = .none

        let category = categories[indexPath.row]
        let counter = CounterViewController(
            minimum: 0, maximum: AppConstants.maximumRulesPerCategory)
        let controller = CategoryViewController(
            category: category,
            supplementaryViewType: .counter(counter))
        childControllers[indexPath.row] = controller
        addChild(controller, constrainedTo: cell.contentView)

        return cell
    }

}

extension HomeViewController: ReuseNotifyingCellDelegate {

    func reuseNotifyingCell(_ cell: ReuseNotifyingCell, didNotify action: ReuseNotifyingCell.Action) {
        switch action {
        case .preparedForReuse(let indexPath):
            guard let controller = childControllers[indexPath.row] else {
                fatalError("Missing child controller for index path \(indexPath)")
            }
            removeChild(controller, constrainedTo: cell.contentView)
            childControllers[indexPath.row] = nil
        }
    }

}
