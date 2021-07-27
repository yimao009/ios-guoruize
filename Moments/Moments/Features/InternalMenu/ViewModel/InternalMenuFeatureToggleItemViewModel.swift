//
//  InternalMenuFeatureToggleItemViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/27.
//

import Foundation

class InternalMenuFeatureToggleItemViewModel: InternalMenuItemViewModel {
    var type: InternalMenuItemType {
        .featureToggle
    }

    var title: String {""}
    var on: Bool { false }

    func select() { }
    func toggleOff() { }
    func toggleOn() { }
}

final class InternalMenuLikeButtonToggleItemViewModel: InternalMenuFeatureToggleItemViewModel {
    private let toggleStore: ToggleDataStoreType
    private var isOn: Bool

    override var title: String {
        return L10n.InternalMenu.likeButtonForMomentEnabled
    }

    override var on: Bool {
        return isOn
    }

    init(toggleStore: ToggleDataStoreType) {
        self.toggleStore = toggleStore
        self.isOn = toggleStore.isToggleOn(.isLikeButtonForMomentEnabled)
    }

    override func toggleOn() {
        toggleStore.update(toggle: .isLikeButtonForMomentEnabled, value: true)
    }

    override func toggleOff() {
        toggleStore.update(toggle: .isLikeButtonForMomentEnabled, value: false)
    }
}
