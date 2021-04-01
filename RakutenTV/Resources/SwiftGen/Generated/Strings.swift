// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Shared {
    /// Aceptar
    internal static let accept = L10n.tr("Localizable", "Shared.accept")
    /// 
    internal static let empty = L10n.tr("Localizable", "Shared.empty")
  }

  internal enum RakutenTV {
    internal enum ListViewController {
      /// You haven't found what you were looking for, man!\n\nBad luck!
      internal static let resulNotFound = L10n.tr("Localizable", "rakutenTV.ListViewController.resulNotFound")
      internal enum Navigation {
        /// RakutenTV
        internal static let title = L10n.tr("Localizable", "rakutenTV.ListViewController.navigation.title")
      }
      internal enum Searching {
        /// Estamos descargando la lista\n\n¿Estas preparado para frikear ?
        internal static let title = L10n.tr("Localizable", "rakutenTV.ListViewController.searching.title")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
