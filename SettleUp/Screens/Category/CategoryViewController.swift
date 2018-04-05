//
//  CategoryViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage
import BonMot
import Then

final class CategoryViewController: UIViewController {

    fileprivate let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 8
        $0.doNotRequireHugging(along: .horizontal)
    }
    fileprivate let titleLabel = UILabel()
    fileprivate let descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
    }
    fileprivate let ruleCountLabel = UILabel()
    fileprivate let supplementaryView = UIView().then {
        $0.requireHugging(along: .horizontal)
    }

    fileprivate let mainStackView = UIStackView()

    enum SupplementaryViewType {
        case counter(CounterViewController)
        case addCustomRule(AddCustomRuleViewController)
        case none
    }

    fileprivate let category: Category
    fileprivate let supplementaryViewType: SupplementaryViewType

    init(category: Category, supplementaryViewType: SupplementaryViewType) {
        self.category = category
        self.supplementaryViewType = supplementaryViewType
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

private extension CategoryViewController {

    func configureView() {
        titleLabel.attributedText = category.title.styled(with: .h1)
        descriptionLabel.attributedText = category.description.styled(with: .body)
        ruleCountLabel.attributedText = L10n.CategoryCell.ruleCount(
            category.rules.count).styled(with: .note)

        switch supplementaryViewType {
        case let .counter(supplementaryVC):
            addChild((supplementaryVC), constrainedTo: supplementaryView)
        case let .addCustomRule(supplementaryVC):
            addChild((supplementaryVC), constrainedTo: supplementaryView)
        case .none:
            break
        }

        contentStackView.addArrangedSubviews(
            titleLabel, descriptionLabel, ruleCountLabel, .flexibleSpace())
        mainStackView.addArrangedSubviews(
            contentStackView, supplementaryView)
        view.addSubview(mainStackView)

        supplementaryView.widthAnchor == 80
        mainStackView.edgeAnchors == edgeAnchors + 16
    }

}
