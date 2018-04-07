//
//  Identifiable.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

protocol Identifiable {

    var id: Int { get }

}

extension Array where Element: Identifiable {

    subscript(id: Int) -> Element? {
        get {
            return first(where: { $0.id == id })
        }
    }

}
