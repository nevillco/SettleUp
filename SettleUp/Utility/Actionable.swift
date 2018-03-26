//
//  Actionable.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

protocol Actionable: class {
    associatedtype ActionType
    associatedtype Delegate

    func notify(_ action: ActionType)
}

extension Actionable {

    func notify(_ action: ActionType) -> () -> Void {
        return { [weak self] in
            self?.notify(action)
        }
    }

    func notify(_ action: ActionType) -> (UIControl) -> Void {
        return { [weak self] _ in
            self?.notify(action)
        }
    }

    func notify(_ action: ActionType) -> (UIAlertAction) -> Void {
        return { [weak self] _ in
            self?.notify(action)
        }
    }

}
