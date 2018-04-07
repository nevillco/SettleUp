//
//  Array+Utility.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

extension Array {

    func randomIndex() -> Index {
        return Int(arc4random_uniform(UInt32(count)))
    }

}
