//
//  ResultService.swift
//  SettleUp
//
//  Created by Connor Neville on 4/7/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

final class ResultService {

}

extension ResultService {

    func generateResults(from selections: [Selection]) -> [SelectionResult] {
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
                excludedRuleIDs.insert(randomRule.id)
                excludedRuleIDs.formUnion(randomRule.excludedRuleIDs)
            }
            let result = SelectionResult(category: selection.category, rules: selectedRules)
            results.append(result)
        }
        return results
    }

}
