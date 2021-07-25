//
//  Configuration.swift
//  Moments
//
//  Created by guoruize on 2021/7/25.
//

import Foundation

enum Configuration {
    enum Error: Swift.Error {
        case missKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
