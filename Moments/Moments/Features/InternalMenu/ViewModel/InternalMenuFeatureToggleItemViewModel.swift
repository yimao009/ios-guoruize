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

    var title: String { fatalError(L10n.Development.fatalErrorSubclassToImplement)}
    var on: Bool { false }

    func select() { }
    func toggle(isOn: Bool) { fatalError(L10n.Development.fatalErrorSubclassToImplement) }

}

final class InternalMenuLikeButtonToggleItemViewModel: InternalMenuFeatureToggleItemViewModel {
    private let toggleDataStore: ToggleDataStoreType
    private var isOn: Bool

    override var title: String {
        return L10n.InternalMenu.likeButtonForMomentEnabled
    }

    override var on: Bool {
        return isOn
    }

    init(toggleDataStore: ToggleDataStoreType) {
        self.toggleDataStore = toggleDataStore
        self.isOn = toggleDataStore.isToggleOn(.isLikeButtonForMomentEnabled)
    }

    override func toggle(isOn: Bool) {
        toggleDataStore.update(toggle: .isLikeButtonForMomentEnabled, value: isOn)
    }
}
