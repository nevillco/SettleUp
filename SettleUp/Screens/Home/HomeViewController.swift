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

    fileprivate let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    fileprivate let introLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.attributedText = L10n.Home.intro.styled(with: .body)
    }
    fileprivate let tableView = UITableView().then {
        $0.rowHeight = UITableViewAutomaticDimension
        $0.estimatedRowHeight = 200
        $0.separatorStyle = .none
    }
    fileprivate var childControllers: [IndexPath: UIViewController] = [:]
    fileprivate let playButton = UIButton(type: .system).then {
        $0.setAttributedTitle(
            L10n.Home.play.styled(with: .cta), for: .normal)
    }

    fileprivate var selections: [Selection]
    weak var delegate: Delegate?

    init(categories: [Category]) {
        self.selections = categories.map({ Selection(category: $0, count: 0) })
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = L10n.Home.title

        tableView.register(cellType: ReuseNotifyingCell.self)
        tableView.delegate = self
        tableView.dataSource = self

        playButton.addTarget(self, action: .playTapped, for: .touchUpInside)

        stackView.addArrangedSubviews(introLabel, tableView, playButton)
        view.addSubview(stackView)

        stackView.edgeAnchors == edgeAnchors
    }

}

extension HomeViewController: UITableViewDelegate { }

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReuseNotifyingCell = tableView.dequeueReusableCell(for: indexPath)
        cell.delegate = self
        cell.indexPath = indexPath
        cell.selectionStyle = .none

        let category = selections[indexPath.row].category
        let supplementaryView: CategoryViewController.SupplementaryViewType
        switch category.isCustom {
        case true:
            let supplementaryVC = AddCustomRuleViewController()
            supplementaryVC.delegate = self
            supplementaryView = .addCustomRule(supplementaryVC)
        case false:
            let supplementaryVC = CounterViewController(
                category: category,
                minimum: 0,
                maximum: AppConstants.maximumRulesPerCategory)
            supplementaryVC.delegate = self
            supplementaryView = .counter(supplementaryVC)
        }
        let controller = CategoryViewController(
            category: category,
            supplementaryViewType: supplementaryView)
        childControllers[indexPath] = controller
        addChild(controller, constrainedTo: cell.contentView)

        return cell
    }

}

extension HomeViewController: Actionable {

    enum Action {
        case didTapPlay(selections: [Selection])
    }

}

fileprivate extension Selector {

    static let playTapped = #selector(HomeViewController.playTapped)

}

private extension HomeViewController {

    @objc func playTapped() {
        notify(.didTapPlay(selections: selections))
    }

}

extension HomeViewController: ReuseNotifyingCellDelegate {

    func reuseNotifyingCell(_ cell: ReuseNotifyingCell, didNotify action: ReuseNotifyingCell.Action) {
        switch action {
        case .preparedForReuse(let indexPath):
            guard let controller = childControllers[indexPath] else {
                fatalError("Missing child controller for index path \(indexPath)")
            }
            removeChild(controller, constrainedTo: cell.contentView)
            childControllers[indexPath] = nil
        }
    }

}

extension HomeViewController: CounterViewControllerDelegate {

    func counterViewController(_ vc: CounterViewController, didNotify action: CounterViewController.Action) {
        let modifiedCategory: Category
        let countOperation: (Int) -> Int
        switch action {
        case let .didIncrement(category):
            modifiedCategory = category
            countOperation = { count in return count + 1 }
        case let .didDecrement(category):
            modifiedCategory = category
            countOperation = { count in return count - 1 }
        }

        let isCorrectSelection: (Selection) -> Bool = { selection in
            return selection.category == modifiedCategory
        }
        guard let existingSelectionIndex = selections.index(where: isCorrectSelection) else {
            fatalError("No selection found for category named \(modifiedCategory.title)")
        }
        let existingSelection = selections[existingSelectionIndex]
        let newCount = countOperation(existingSelection.count)
        let newSelection = Selection(category: existingSelection.category, count: newCount)
        selections[existingSelectionIndex] = newSelection
    }

}

extension HomeViewController: AddCustomRuleViewControllerDelegate {

    func addCustomRuleViewController(_ vc: AddCustomRuleViewController, didNotify action: AddCustomRuleViewController.Action) {
        switch action {
        case .didTapButton:
            print("IAP gate")
        }
    }

}
