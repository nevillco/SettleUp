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
    case greenDevCards = "Green Development Cards"
    case yellowDevCards = "Yellow Development Cards"
    case stealing = "Stealing"
    case rollNumber = "Dice Roll Number"
    case tileNumber = "Tile Number"
    case victoryPointNumber = "Victory Point Number"
    case drink = "Drink"
    case finishYourDrink = "Finish Your Drink"
    case longestRoad = "Longest Road"
    case largestArmy = "Largest Army"
    case portConversion = "Port Conversion"
    case resourcePickup = "Resource Pickup"
    case desert = "Desert"
    case coast = "Coast"
    case wildCard = "Wild Card"
    case cardDumping = "Card Dumping"
    case prediction = "Prediction"
    case initialSettlements = "Initial Settlements"

}
