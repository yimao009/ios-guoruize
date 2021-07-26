//
//  BaseTableViewCell.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

class BaseTableViewCell<T: ListItemViewModel>: UITableViewCell, ListItemComponent {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    func update(with viewModel: ListItemViewModel) {
        (viewModel as? T).map({ update($0 )})
    }

    func update(_ viewModel: T) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
