//
//  ChildManagedCell.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

final class ChildManagedCell: UITableViewCell, Actionable {

    var managingController: UIViewController?
    weak var delegate: Delegate?

    enum Action {
        case preparedForReuse(UIViewController)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        if let managingController = managingController {
            notify(.preparedForReuse(managingController))
        }
    }

}
