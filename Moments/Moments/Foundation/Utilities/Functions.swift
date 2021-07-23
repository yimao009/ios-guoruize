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
