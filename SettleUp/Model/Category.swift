//
//  Category.swift
//  SettleUp
//
//  Created by Connor Neville on 3/22/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

struct Category: Codable, Equatable {

    let id: String
    let title: String
    let description: String
    let rules: [Rule]

    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }

}
