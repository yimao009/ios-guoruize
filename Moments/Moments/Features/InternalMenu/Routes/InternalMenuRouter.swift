//
//  InternalMenuRouter.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

protocol InternalMenuRouting {
    func showDesignKit()
}

struct InternalMenuRouter: InternalMenuRouting {
    weak var fromController: UIViewController?

    init(fromController: UIViewController) {
        self.fromController = fromController
    }

    func showDesignKit() {
        fromController?.show(DesignKitDemoViewController(), sender: fromController)
    }
}
