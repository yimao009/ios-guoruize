//
//  DesignKitDemoItemViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import Foundation

final class DesignKitDemoItemViewModel: InternalMenuActionTriggerItemViewModel {
    private let router: InternalMenuRouting

    init(router: InternalMenuRouting) {
        self.router = router
    }

    override var title: String {
        L10n.InternalMenu.designKitDemo
    }

    override func select() {
        router.showDesignKit()
    }
}
