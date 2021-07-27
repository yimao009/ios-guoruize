//
//  UserDataStore.swift
//  Moments
//
//  Created by guoruize on 2021/7/27.
//

import Foundation

protocol UserDataStoreType {
    var userID: String { get }
}

struct UserDataStore: UserDataStoreType {
    // Hardcode the user id to 0
    var userID: String {
        "0"
    }

    private init() {}

    static let current = UserDataStore()
}
