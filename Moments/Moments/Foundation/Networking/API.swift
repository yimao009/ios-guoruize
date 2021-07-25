//
//  API.swift
//  Moments
//
//  Created by guoruize on 2021/7/25.
//

import Foundation

enum API {
    // swiftlint:disable force_try
    // swiftlint:disable force_unwrapping
    // swiftlint:disable no_hardcoded_strings
    static let baseURL = try! URL(string: Configuration.value(for: "API_BASE_URL"))!
}
