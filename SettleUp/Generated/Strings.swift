// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Home {
    /// SettleUp
    internal static let title = L10n.tr("Localizable", "Home.title")
  }

  internal enum Loading {

    internal enum ErrorAlert {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "Loading.Error_Alert.cancel")
      /// Clear Custom Data and Retry
      internal static let forceRetry = L10n.tr("Localizable", "Loading.Error_Alert.forceRetry")
      /// There was an error, and we weren’t able to load your SettleUp rules. Tap below to retry.
      internal static let message = L10n.tr("Localizable", "Loading.Error_Alert.message")
      /// Retry
      internal static let retry = L10n.tr("Localizable", "Loading.Error_Alert.retry")
      /// Error Loading Data
      internal static let title = L10n.tr("Localizable", "Loading.Error_Alert.title")
    }
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
