//
//  UIImageViewExtensions.swift
//  DesignKit
//
//  Created by guoruize on 2021/7/24.
//

import UIKit

public extension UIImageView {
    func asAvatar(cornerRadius: CGFloat = 4) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
