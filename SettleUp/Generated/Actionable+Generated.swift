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

// MARK: - CounterViewController
protocol CounterViewControllerDelegate: class {
func counterViewController(_ vc: CounterViewController, didNotify action: CounterViewController.Action)
}

extension CounterViewController {

typealias ActionType = Action
typealias Delegate = CounterViewControllerDelegate

func notify(_ action: ActionType) {
delegate?.counterViewController(self, didNotify: action)
}

}

// MARK: - HomeViewController
protocol HomeViewControllerDelegate: class {
func homeViewController(_ vc: HomeViewController, didNotify action: HomeViewController.Action)
}

extension HomeViewController {

typealias ActionType = Action
typealias Delegate = HomeViewControllerDelegate

func notify(_ action: ActionType) {
delegate?.homeViewController(self, didNotify: action)
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

// MARK: - ResultsViewController
protocol ResultsViewControllerDelegate: class {
func resultsViewController(_ vc: ResultsViewController, didNotify action: ResultsViewController.Action)
}

extension ResultsViewController {

typealias ActionType = Action
typealias Delegate = ResultsViewControllerDelegate

func notify(_ action: ActionType) {
delegate?.resultsViewController(self, didNotify: action)
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
