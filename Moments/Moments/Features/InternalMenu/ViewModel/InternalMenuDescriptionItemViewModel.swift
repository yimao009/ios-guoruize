//
//  InternalMenuDescriptionItemViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import Foundation

struct InternalMenuDescriptionItemViewModel: InternalMenuItemViewModel {

    let title: String

    var type: InternalMenuItemType {
        .description
    }

    func select() { }
}
