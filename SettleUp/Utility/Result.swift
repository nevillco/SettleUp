//
//  Result.swift
//  SettleUp
//
//  Created by Connor Neville on 3/23/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
