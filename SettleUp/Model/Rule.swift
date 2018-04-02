//
//  Rule.swift
//  SettleUp
//
//  Created by Connor Neville on 3/22/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

struct Rule: Codable, AutoEquatable {

    let id: Int
    let description: String
    let notes: String?
    let excludedRuleIDs: [Int]
    let tags: [Tag]

}
