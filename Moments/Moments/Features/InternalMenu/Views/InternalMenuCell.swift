//
//  InternalMenuCell.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

protocol InternalMenuItemViewing {
    func update(with item: InternalMenuItemViewModel)
}

class InternalMenuCell<T: InternalMenuItemViewModel>: UITableViewCell, InternalMenuItemViewing {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with item: InternalMenuItemViewModel) {
        (item as? T).map { update($0) }
    }

    func update(_ item: T) {
        fatalError("Subclass has to implement this function")
    }
}
