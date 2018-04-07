//
//  ResultService.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

typealias CategorySelection = (category: Category, count: Int)
final class ResultService {

    fileprivate let selections: [CategorySelection]

    init(selections: [CategorySelection]) {
        self.selections = selections
    }

}
