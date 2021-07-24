//
//  InternalMenuActionTriggerCell.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

class InternalMenuActionTriggerCell: InternalMenuCell<InternalMenuActionTriggerItemViewModel> {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var item: InternalMenuActionTriggerItemViewModel?

    override func update(_ item: InternalMenuActionTriggerItemViewModel) {
        self.item = item
        textLabel?.text = item.title
        textLabel?.textColor = item.titleColor
        textLabel?.textAlignment = item.textAlignment
        detailTextLabel?.attributedText = item.detailAttributedText
        imageView?.image = item.icon
        imageView?.tintColor = item.iconTint
    }
}
