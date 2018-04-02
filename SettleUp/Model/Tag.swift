//
//  TestEnum.swift
//  SettleUp
//
//  Created by Connor Neville on 4/2/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

enum Tag: String, Codable, AutoEquatable {

    case roads = "Roads"
    case settlements = "Settlements"
    case cities = "Cities"
    case devCards = "Development Cards"
    case knights = "Knights"
    case greenDevCards = "Green Development Cards"
    case yellowDevCards = "Yellow Development Cards"
    case robber = "Robber"
    case rollNumber = "Dice Roll Number"
    case victoryPointNumber = "Victory Point Number"
    case drink = "Drink"
    case finishYourDrink = "Finish Your Drink"
    case longestRoad = "Longest Road"
    case largestArmy = "Largest Army"
    case portConversion = "Port Conversion"
    case desert = "Desert"
    case coast = "Coast"
    case cardDumping = "Card Dumping"
    case prediction = "Prediction"

}
