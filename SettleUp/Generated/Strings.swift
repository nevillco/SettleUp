// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum CategoryCell {
    /// %d rules
    internal static func ruleCount(_ p1: Int) -> String {
      return L10n.tr("Localizable", "Category_Cell.Rule_Count", p1)
    }
  }

  internal enum Home {
    /// Select the rules you want to add and press 'Play' <b>before starting your game of Settlers of Catan</b>.
    internal static let intro = L10n.tr("Localizable", "Home.Intro")
    /// Play
    internal static let play = L10n.tr("Localizable", "Home.Play")
    /// SettleUp
    internal static let title = L10n.tr("Localizable", "Home.Title")
  }

  internal enum Loading {

    internal enum ErrorAlert {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "Loading.Error_Alert.Cancel")
      /// Clear Custom Data and Retry
      internal static let forceRetry = L10n.tr("Localizable", "Loading.Error_Alert.Force_Retry")
      /// There was an error, and we weren’t able to load your SettleUp rules. Tap below to retry.
      internal static let message = L10n.tr("Localizable", "Loading.Error_Alert.Message")
      /// Retry
      internal static let retry = L10n.tr("Localizable", "Loading.Error_Alert.Retry")
      /// Error Loading Data
      internal static let title = L10n.tr("Localizable", "Loading.Error_Alert.Title")
    }
  }

  internal enum Results {
    /// Results
    internal static let title = L10n.tr("Localizable", "Results.Title")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
