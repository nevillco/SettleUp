//
//  ResultService.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

typealias Selection = (category: Category, count: Int)
typealias SelectionResult = (category: Category, rules: [Rule])
final class ResultService {

    typealias RuleGenerationCompletion = ([Rule]) -> Void

    fileprivate let selections: [Selection]

    init(selections: [Selection]) {
        self.selections = selections
    }

}

extension ResultService {

    func generateResults() -> [SelectionResult] {
        var excludedRuleIDs = Set<Int>()
        let isIncludedRule: (Rule) -> Bool = { rule in
            return !excludedRuleIDs.contains(rule.id)
        }
        var results: [SelectionResult] = []
        for selection in selections {
            var selectableRules = selection.category.rules.filter(isIncludedRule)
            var selectedRules: [Rule] = []
            for _ in 0..<selection.count {
                let randomIndex = selectableRules.randomIndex()
                let randomRule = selectableRules[randomIndex]
                selectedRules.append(randomRule)
                selectableRules.remove(at: randomIndex)
                let rulesToExclude = [randomRule.id] + randomRule.excludedRuleIDs
                for ruleToExclude in rulesToExclude {
                    excludedRuleIDs.insert(ruleToExclude)
                }
            }
            results.append((category: selection.category, rules: selectedRules))
        }
        return results
    }

}
