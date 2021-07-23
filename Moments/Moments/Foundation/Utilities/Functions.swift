//
//  Functions.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

@discardableResult
public func configure<T: AnyObject>(_ object: T, closure: (T) -> Void) -> T {
    closure(object)
    return object
}

var rootViewController: UIViewController? {
    let keyWindow = UIApplication.shared.connectedScenes
        .filter({ $0.activationState == .foregroundActive })
        .map({ $0 as? UIWindowScene })
        .compactMap({ $0 })
        .first?.windows
        .filter({ $0.isKeyWindow }).first
    return keyWindow?.rootViewController
}
