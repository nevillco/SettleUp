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
guard lhs.isCustom == rhs.isCustom else { return false }
return true
}
// MARK: - Rule AutoEquatable
extension Rule: Equatable {}
internal func == (lhs: Rule, rhs: Rule) -> Bool {
guard lhs.id == rhs.id else { return false }
guard lhs.description == rhs.description else { return false }
guard compareOptionals(lhs: lhs.notes, rhs: rhs.notes, compare: ==) else { return false }
guard lhs.excludedRuleIDs == rhs.excludedRuleIDs else { return false }
guard lhs.tags == rhs.tags else { return false }
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
// MARK: - Tag AutoEquatable
extension Tag: Equatable {}
internal func == (lhs: Tag, rhs: Tag) -> Bool {
switch (lhs, rhs) {
case (.roads, .roads):
return true
case (.settlements, .settlements):
return true
case (.cities, .cities):
return true
case (.devCards, .devCards):
return true
case (.greenDevCards, .greenDevCards):
return true
case (.yellowDevCards, .yellowDevCards):
return true
case (.stealing, .stealing):
return true
case (.rollNumber, .rollNumber):
return true
case (.tileNumber, .tileNumber):
return true
case (.victoryPointNumber, .victoryPointNumber):
return true
case (.drink, .drink):
return true
case (.finishYourDrink, .finishYourDrink):
return true
case (.longestRoad, .longestRoad):
return true
case (.largestArmy, .largestArmy):
return true
case (.portConversion, .portConversion):
return true
case (.resourcePickup, .resourcePickup):
return true
case (.desert, .desert):
return true
case (.coast, .coast):
return true
case (.wildCard, .wildCard):
return true
case (.cardDumping, .cardDumping):
return true
case (.prediction, .prediction):
return true
case (.initialSettlements, .initialSettlements):
return true
default: return false
}
}
