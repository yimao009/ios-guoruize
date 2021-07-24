//
//  InternalMenuActionTriggerItemViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

class InternalMenuActionTriggerItemViewModel: InternalMenuItemViewModel {
    var type: InternalMenuItemType {
        .actionTrigger
    }

    func select() { }

    var title: String { "" }
    var titleColor: UIColor { .black }
    var textAlignment: NSTextAlignment { .left }
    var detailAttributedText: NSAttributedString? { nil }
    var icon: UIImage? { nil }
    var iconTint: UIColor? { nil }
}
