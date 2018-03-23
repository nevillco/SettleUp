//
//  Category.swift
//  SettleUp
//
//  Created by Connor Neville on 3/22/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

struct Category: Codable {

    let id: String
    let title: String
    let description: String
    let rules: [Rule]

}
