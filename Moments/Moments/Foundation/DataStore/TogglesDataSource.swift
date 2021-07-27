//
//  TogglesDataSource.swift
//  Moments
//
//  Created by guoruize on 2021/7/27.
//

import Foundation

enum Toggle: String {
    case isLikeButtonForMomentEnabled
}

protocol ToggleDataStoreType {
    func isToggleOn(_ toggle: Toggle) -> Bool
    func update(toggle: Toggle, value: Bool)
}

struct TogglesDataStore: ToggleDataStoreType {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        self.userDefaults.register(defaults: [Toggle.isLikeButtonForMomentEnabled.rawValue: false])
    }

    func isToggleOn(_ toggle: Toggle) -> Bool {
        self.userDefaults.bool(forKey: toggle.rawValue)
    }


    func update(toggle: Toggle, value: Bool) {
        self.userDefaults.setValue(value, forKey: toggle.rawValue)
    }
}
