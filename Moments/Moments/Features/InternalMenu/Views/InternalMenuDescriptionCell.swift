//
//  InternalMenuDescriptionCell.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

/// 显示版本的cell
class InternalMenuDescriptionCell: InternalMenuCell<InternalMenuDescriptionItemViewModel> {
    override func update(_ item: InternalMenuDescriptionItemViewModel) {
        textLabel?.text = item.title
    }
}
