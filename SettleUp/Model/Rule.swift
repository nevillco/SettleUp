//
//  Rule.swift
//  SettleUp
//
//  Created by Connor Neville on 3/22/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

struct Rule: Codable, Equatable {

    let id: String
    let description: String
    let detailedDescription: String?
    let exclusiveRuleIDs: [String]

    static func ==(lhs: Rule, rhs: Rule) -> Bool {
        return lhs.id == rhs.id
    }

}
