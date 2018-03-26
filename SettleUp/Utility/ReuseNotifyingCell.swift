//
//  ReuseNotifyingCell.swift
//  SettleUp
//
//  Created by Connor Neville on 3/26/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Reusable

class ReuseNotifyingCell: UITableViewCell, Actionable, Reusable {

    var indexPath: IndexPath?
    weak var delegate: Delegate?

    enum Action {
        case preparedForReuse(IndexPath)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        guard let indexPath = indexPath else {
            fatalError("ReuseNotifyingCell prepared for reuse without an index path")
        }
        notify(.preparedForReuse(indexPath))
    }

}
