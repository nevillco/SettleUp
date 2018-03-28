//
//  CounterViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage

final class CounterViewController: UIViewController {

    fileprivate var internalCount = 0 {
        didSet {
            updateCountLabel()
        }
    }

    fileprivate let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    fileprivate let plusButton = UIButton().then {
        $0.setAttributedTitle("+".styled(with: .counter), for: .normal)
    }
    fileprivate let countLabel = UILabel()
    fileprivate let minusButton = UIButton().then {
        $0.setAttributedTitle("-".styled(with: .counter), for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}

private extension CounterViewController {

    func configureView() {
        updateCountLabel()
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)

        stackView.addArrangedSubviews(plusButton, countLabel, minusButton)
        view.addSubview(stackView)

        stackView.edgeAnchors == view.edgeAnchors + 4
    }

    func updateCountLabel() {
        countLabel.attributedText = "\(internalCount)".styled(with: .counter)
    }

}

private extension CounterViewController {

    @objc func plusTapped() {
        print("+")
    }

    @objc func minusTapped() {
        print("-")
    }

}
