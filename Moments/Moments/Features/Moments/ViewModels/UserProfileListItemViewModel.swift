//
//  UserProfileListItemViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import Foundation

struct UserProfileListItemViewModel: ListItemViewModel {
    let name: String
    let avatarURL: URL?
    let backgroundImageURL: URL?

    init(userDetails: MomentsDetails.UserDetails) {
        self.name = userDetails.name
        avatarURL = URL(string: userDetails.avatar)
        backgroundImageURL = URL(string: userDetails.backgroundImage)
    }

    static var reuseIdentifier: String {
        String(describing: self)
    }
}
