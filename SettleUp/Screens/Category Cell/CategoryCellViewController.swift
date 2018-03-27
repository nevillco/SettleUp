//
//  CategoryCellViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage

final class CategoryCellViewController: UIViewController {

    let category: Category

    fileprivate let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 8
        return view
    }()
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    fileprivate let descriptionLabel: UILabel = {
        let label = UILabel()
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    fileprivate let ruleCountLabel: UILabel = {
        let label = UILabel()
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    fileprivate let supplementaryView = UIView()

    fileprivate let mainStackView = UIStackView()

    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}

private extension CategoryCellViewController {

    func configureView() {
        titleLabel.text = category.title
        descriptionLabel.text = category.description
        ruleCountLabel.text = "\(category.rules.count) rules"

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addArrangedSubview(ruleCountLabel)
        mainStackView.addArrangedSubview(contentStackView)
        mainStackView.addArrangedSubview(supplementaryView)
        view.addSubview(mainStackView)

        mainStackView.edgeAnchors == edgeAnchors
    }

}
