//
//  ResultsViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage

final class ResultsViewController: UIViewController {

    fileprivate let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    fileprivate let tableView = UITableView().then {
        $0.rowHeight = UITableViewAutomaticDimension
        $0.estimatedRowHeight = 200
        $0.separatorStyle = .none
    }
    fileprivate var childControllers: [IndexPath: UIViewController] = [:]
    fileprivate let playAgainButton = UIButton().then {
        $0.setAttributedTitle(L10n.Results.playAgain.styled(with: .cta), for: .normal)
    }

    fileprivate let selections: [Selection]
    fileprivate let service = ResultService()
    fileprivate var results: [SelectionResult]

    init(selections: [Selection]) {
        self.selections = selections
        results = service.generateResults(from: selections)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = L10n.Results.title

        tableView.register(cellType: ResultCell.self)
        tableView.dataSource = self

        playAgainButton.addTarget(self, action: .playAgainTapped, for: .touchUpInside)

        stackView.addArrangedSubviews(tableView, playAgainButton)
        view.addSubview(stackView)

        stackView.edgeAnchors == edgeAnchors
    }

}

extension ResultsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results[section].rules.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultCell = tableView.dequeueReusableCell(for: indexPath)
        let rule = results[indexPath.section].rules[indexPath.row]
        cell.configure(rule: rule)
        return cell
    }

}

fileprivate extension Selector {

    static let playAgainTapped = #selector(ResultsViewController.playAgainTapped)

}

private extension ResultsViewController {

    @objc func playAgainTapped() {
        self.results = service.generateResults(from: selections)
        tableView.reloadData()
    }

}
