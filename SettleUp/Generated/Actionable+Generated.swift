// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



//swiftlint:disable:previous vertical_whitespace

// MARK: - AddCustomRuleViewController
protocol AddCustomRuleViewControllerDelegate: class {
func addCustomRuleViewController(_ vc: AddCustomRuleViewController, didNotify action: AddCustomRuleViewController.Action)
}

extension AddCustomRuleViewController {

typealias ActionType = Action
typealias Delegate = AddCustomRuleViewControllerDelegate

func notify(_ action: ActionType) {
delegate?.addCustomRuleViewController(self, didNotify: action)
}

}

// MARK: - LoadingViewController
protocol LoadingViewControllerDelegate: class {
func loadingViewController(_ vc: LoadingViewController, didNotify action: LoadingViewController.Action)
}

extension LoadingViewController {

typealias ActionType = Action
typealias Delegate = LoadingViewControllerDelegate

func notify(_ action: ActionType) {
delegate?.loadingViewController(self, didNotify: action)
}

}

// MARK: - ReuseNotifyingCell
protocol ReuseNotifyingCellDelegate: class {
func reuseNotifyingCell(_ cell: ReuseNotifyingCell, didNotify action: ReuseNotifyingCell.Action)
}

extension ReuseNotifyingCell {

typealias ActionType = Action
typealias Delegate = ReuseNotifyingCellDelegate

func notify(_ action: ActionType) {
delegate?.reuseNotifyingCell(self, didNotify: action)
}

}
