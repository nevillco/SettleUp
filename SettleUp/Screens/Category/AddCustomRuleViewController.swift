//
//  AddCustomRuleViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 4/5/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Anchorage

final class AddCustomRuleViewController: UIViewController {

    fileprivate let button = UIButton().then {
        $0.setAttributedTitle("+".styled(with: .cta), for: .normal)
    }

    weak var delegate: Delegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}

private extension AddCustomRuleViewController {

    func configureView() {
        button.addTarget(self, action: .buttonTapped, for: .touchUpInside)

        view.addSubview(button)

        button.edgeAnchors == edgeAnchors
    }

}

fileprivate extension Selector {

    static let buttonTapped = #selector(AddCustomRuleViewController.buttonTapped)

}

private extension AddCustomRuleViewController {

    @objc func buttonTapped() {
        notify(.didTapButton)
    }

}

extension AddCustomRuleViewController: Actionable {

    enum Action {
        case didTapButton
    }

}
