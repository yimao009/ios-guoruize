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
            .filter({ $0.isKeyWindow }).first
        return keyWindow?.rootViewController
    }
}
