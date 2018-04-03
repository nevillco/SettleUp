//
//  SettleUpTests.swift
//  SettleUpTests
//
//  Created by Connor Neville on 4/3/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import XCTest
@testable import SettleUp

class SettleUpTests: XCTestCase {

    var categories: [SettleUp.Category] = []

    override func setUp() {
        super.setUp()
        let exp = expectation(description: "setUp")
        let service = DataService()
        service.fetchData { (result) in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success(let categories):
                self.categories = categories
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 2) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testLoadingCategories() {
        XCTAssertFalse(categories.isEmpty)
    }

    func testUniqueIDs() {
        let allIDs = categories.flatMap({ $0.rules }).map({ $0.id }).sorted()
        let allIDsNoDuplicates = Array(Set(allIDs)).sorted()
        XCTAssertEqual(allIDs, allIDsNoDuplicates)
    }

    func testNoMissingIDs() {
        let allIDs = categories.flatMap({ $0.rules }).map({ $0.id }).sorted()
        guard let maxID = allIDs.max() else {
            XCTFail("Couldn’t find the max ID")
            return
        }
        for id in 1...maxID {
            XCTAssertTrue(allIDs.contains(id))
        }
    }

    func testValidExcludedRules() {
        let allRules = categories.flatMap({ $0.rules })
        let rulesByID: [Int: Rule] = allRules.reduce([:]) { (dict, rule) in
            var dict = dict
            dict[rule.id] = rule
            return dict
        }
        for rule in allRules {
            for excludedRuleID in rule.excludedRuleIDs {
                let possibleExcludedRule = rulesByID[excludedRuleID]
                XCTAssertNotNil(possibleExcludedRule, "Rule \(rule.id) excludes rule \(excludedRuleID), but that rule doesn’t exist")
            }
        }
    }

    func testBidirectionalExcludedRules() {
        let allRules = categories.flatMap({ $0.rules })
        let rulesByID: [Int: Rule] = allRules.reduce([:]) { (dict, rule) in
            var dict = dict
            dict[rule.id] = rule
            return dict
        }
        for rule in allRules {
            for excludedRuleID in rule.excludedRuleIDs {
                let excludedRule = rulesByID[excludedRuleID]!
                XCTAssertTrue(
                    excludedRule.excludedRuleIDs.contains(rule.id),
                    "Rule \(rule.id) excludes rule \(excludedRuleID), but rule \(excludedRuleID) does not exclude rule \(rule.id)" )
            }
        }
    }

    func testAllRulesHaveTags() {
        let allRules = categories.flatMap({ $0.rules })
        for rule in allRules {
            XCTAssertFalse(rule.tags.isEmpty)
        }
    }
    
}
