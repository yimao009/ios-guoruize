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
    var userID: String {
        "1"
    }

    private init() {}

    static let current = UserDataStore()
}
