//
//  UIApplicationExtension.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        let keyWindow = connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?.windows
            .first(where: { $0.isKeyWindow })
        return keyWindow?.rootViewController
    }

    static var appVersion: String {
        // swiftlint:disable no_hardcoded_strings
        return Bundle.main.object(forInfoDictionaryKey: L10n.InternalMenu.cfBundleVersion) as? String ?? "1.0"
    }
}
