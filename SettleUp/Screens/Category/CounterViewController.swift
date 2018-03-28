//
//  CounterViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/27/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage

final class CounterViewController: UIViewController {

    var count = 0 {
        didSet {
            updateCountLabel()
            updateButtonStates()
        }
    }
    fileprivate let minimum: Int
    fileprivate let maximum: Int

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

    init(minimum: Int, maximum: Int) {
        self.minimum = minimum
        self.maximum = maximum
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

private extension CounterViewController {

    func configureView() {
        updateCountLabel()
        updateButtonStates()

        plusButton.addTarget(self, action: .plusTapped, for: .touchUpInside)
        minusButton.addTarget(self, action: .minusTapped, for: .touchUpInside)

        stackView.addArrangedSubviews(plusButton, countLabel, minusButton)
        view.addSubview(stackView)

        stackView.edgeAnchors == view.edgeAnchors + 4
    }

    func updateCountLabel() {
        countLabel.attributedText = "\(count)".styled(with: .counter)
    }

    func updateButtonStates() {
        plusButton.isEnabled = count < maximum
        minusButton.isEnabled = count > minimum
    }

}

fileprivate extension Selector {

    static let plusTapped = #selector(CounterViewController.plusTapped)
    static let minusTapped = #selector(CounterViewController.minusTapped)

}

private extension CounterViewController {

    @objc func plusTapped() {
        count += 1
    }

    @objc func minusTapped() {
        count -= 1
    }

}
