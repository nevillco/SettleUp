//
//  RootViewController.swift
//  SettleUp
//
//  Created by Connor Neville on 3/14/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Reinstate
import UIKit

final class RootViewController: UIViewController, StatefulViewController {

    enum State: Equatable {
        case loading
        case loaded([Category])

        static func == (lhs: RootViewController.State, rhs: RootViewController.State) -> Bool {
            switch (lhs, rhs) {
            case (.loading, .loading):
                return true
            case let (.loaded(lhsCategories), .loaded(rhsCategories)):
                return lhsCategories == rhsCategories
            default:
                return false
            }
        }
    }
    var state: State = .loading
    var currentStateManagedChildren: [UIView: UIViewController] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialState()
    }

}

extension RootViewController {

    func transitionBehavior(from oldState: RootViewController.State, to newState: RootViewController.State, in view: UIView) -> StateTransitionBehavior {
        return StateTransitionBehavior(
            order: .simultaneous,
            additionAnimations: (duration: 0.3, options: .transitionCrossDissolve))
    }

    func childViewController(for state: RootViewController.State, in view: UIView) -> UIViewController {
        switch state {
        case .loading:
            let vc = LoadingViewController()
            vc.delegate = self
            return vc
        case .loaded:
            return UIViewController()
        }
    }

}

extension RootViewController: LoadingViewControllerDelegate {

    func loadingViewController(_ vc: LoadingViewController, didNotify action: LoadingViewController.Action) {
        switch action {
        case .didFetch(let categories):
            transition(to: .loaded(categories))
        }
    }

}
