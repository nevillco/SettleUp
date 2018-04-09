//
//  RuleViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage
import BonMot
import Reusable
import Then

final class ResultCell: UITableViewCell, Reusable {

    fileprivate let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 8
        $0.doNotRequireHugging(along: .horizontal)
    }
    fileprivate let descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
    }
    fileprivate let additionalInfoButton = UIButton().then {
        $0.setAttributedTitle(
            L10n.RuleCell.additionalInfo.styled(with: .smallButton),
            for: .normal)
    }
    fileprivate let supplementaryView = UIView().then {
        $0.requireHugging(along: .horizontal)
    }

    fileprivate let mainStackView = UIStackView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ResultCell {

    func configure(rule: Rule) {
        descriptionLabel.attributedText = rule.description.styled(with: .body)
    }

}

private extension ResultCell {

    func configureView() {
        selectionStyle = .none

        contentStackView.addArrangedSubviews(
            descriptionLabel, additionalInfoButton, .flexibleSpace())
        mainStackView.addArrangedSubviews(
            contentStackView, supplementaryView)
        contentView.addSubview(mainStackView)

        supplementaryView.widthAnchor == 80
        mainStackView.edgeAnchors == contentView.edgeAnchors + 16
    }

}
