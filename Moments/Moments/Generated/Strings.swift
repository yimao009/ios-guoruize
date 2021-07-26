// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Development {
    /// Default Configuration
    internal static let defaultConfiguration = L10n.tr("Localizable", "development.defaultConfiguration")
    /// This property has been accessed before the superview has been loaded. Only use this property in `viewDidLoad` or later, as accessing it inside `init` may add a second instance of this view to the hierarchy.
    internal static let fatalErrorAccessedAutomaticallyAdjustedContentViewEarly = L10n.tr("Localizable", "development.fatalErrorAccessedAutomaticallyAdjustedContentViewEarly")
    /// init(coder:) has not been implemented
    internal static let fatalErrorInitCoderNotImplemented = L10n.tr("Localizable", "development.fatalErrorInitCoderNotImplemented")
    /// Subclass has to implement this function
    internal static let fatalErrorSubclassToImplement = L10n.tr("Localizable", "development.fatalErrorSubclassToImplement")
    /// /graphql
    internal static let graphqlPath = L10n.tr("Localizable", "development.graphqlPath")
  }

  internal enum InternalMenu {
    /// AppName
    internal static let appName = L10n.tr("Localizable", "internalMenu.appName")
    /// Area 51
    internal static let area51 = L10n.tr("Localizable", "internalMenu.area51")
    /// Avatars
    internal static let avatars = L10n.tr("Localizable", "internalMenu.avatars")
    /// CFBundleName
    internal static let cfBundleName = L10n.tr("Localizable", "internalMenu.CFBundleName")
    /// CFBundleVersion
    internal static let cfBundleVersion = L10n.tr("Localizable", "internalMenu.CFBundleVersion")
    /// Colors
    internal static let colors = L10n.tr("Localizable", "internalMenu.colors")
    /// DesignKit Demo
    internal static let designKitDemo = L10n.tr("Localizable", "internalMenu.designKitDemo")
    /// General Info
    internal static let generalInfo = L10n.tr("Localizable", "internalMenu.generalInfo")
    /// Typography
    internal static let typography = L10n.tr("Localizable", "internalMenu.typography")
    /// Version
    internal static let version = L10n.tr("Localizable", "internalMenu.version")
  }

  internal enum MomentsList {
    /// Something went wrong, please try again later
    internal static let errorMessage = L10n.tr("Localizable", "momentsList.errorMessage")
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
