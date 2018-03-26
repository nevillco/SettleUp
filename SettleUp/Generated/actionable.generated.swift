// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable:previous vertical_whitespace

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
