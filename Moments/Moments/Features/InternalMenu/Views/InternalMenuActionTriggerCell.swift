//
//  InternalMenuActionTriggerCell.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

class InternalMenuActionTriggerCell: InternalMenuCell<InternalMenuActionTriggerItemViewModel> {

    var item: InternalMenuActionTriggerItemViewModel?

    override func update(_ item: InternalMenuActionTriggerItemViewModel) {
        accessoryType = .disclosureIndicator
        self.item = item
        textLabel?.text = item.title
        textLabel?.textColor = item.titleColor
        textLabel?.textAlignment = item.textAlignment
        detailTextLabel?.attributedText = item.detailAttributedText
        imageView?.image = item.icon
        imageView?.tintColor = item.iconTint
    }
}
