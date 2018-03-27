//
//  CategoryCellViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage
import BonMot
import Then

final class CategoryCellViewController: UIViewController {

    let category: Category

    fileprivate let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 8
    }
    fileprivate let titleLabel = UILabel()
    fileprivate let descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
    }
    fileprivate let ruleCountLabel = UILabel()
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
        titleLabel.attributedText = category.title.styled(with: .h1)
        descriptionLabel.attributedText = category.description.styled(with: .body)
        ruleCountLabel.attributedText = L10n.CategoryCell.ruleCount(
            category.rules.count).styled(with: .note)

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addArrangedSubview(ruleCountLabel)
        mainStackView.addArrangedSubview(contentStackView)
        mainStackView.addArrangedSubview(supplementaryView)
        view.addSubview(mainStackView)

        mainStackView.edgeAnchors == edgeAnchors + 16
    }

}
