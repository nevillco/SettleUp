// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable file_length
fileprivate func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
switch (lhs, rhs) {
case let (lValue?, rValue?):
return compare(lValue, rValue)
case (nil, nil):
return true
default:
return false
}
}

fileprivate func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
guard lhs.count == rhs.count else { return false }
for (idx, lhsItem) in lhs.enumerated() {
guard compare(lhsItem, rhs[idx]) else { return false }
}

return true
}


// MARK: - AutoEquatable for classes, protocols, structs
// MARK: - Category AutoEquatable
extension Category: Equatable {}
internal func == (lhs: Category, rhs: Category) -> Bool {
guard lhs.id == rhs.id else { return false }
guard lhs.title == rhs.title else { return false }
guard lhs.description == rhs.description else { return false }
guard lhs.rules == rhs.rules else { return false }
return true
}
// MARK: - Rule AutoEquatable
extension Rule: Equatable {}
internal func == (lhs: Rule, rhs: Rule) -> Bool {
guard lhs.id == rhs.id else { return false }
guard lhs.description == rhs.description else { return false }
guard compareOptionals(lhs: lhs.detailedDescription, rhs: rhs.detailedDescription, compare: ==) else { return false }
guard lhs.exclusiveRuleIDs == rhs.exclusiveRuleIDs else { return false }
return true
}

// MARK: - AutoEquatable for Enums
// MARK: - RootViewController.State AutoEquatable
extension RootViewController.State: Equatable {}
internal func == (lhs: RootViewController.State, rhs: RootViewController.State) -> Bool {
switch (lhs, rhs) {
case (.loading, .loading):
return true
case (.loaded(let lhs), .loaded(let rhs)):
return lhs == rhs
default: return false
}
}
