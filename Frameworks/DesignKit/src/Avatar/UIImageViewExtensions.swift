//
//  UIImageViewExtensions.swift
//  DesignKit
//
//  Created by guoruize on 2021/7/24.
//

import UIKit

public extension UIImageView {
    func asAvatar() {
        clipsToBounds = true
        layer.cornerRadius = 2
    }
}
