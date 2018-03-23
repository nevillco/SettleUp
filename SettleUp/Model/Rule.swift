//
//  Rule.swift
//  SettleUp
//
//  Created by Connor Neville on 3/22/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

struct Rule: Codable {

    let id: String
    let description: String
    let detailedDescription: String?
    let exclusiveRuleIDs: [String]

}
