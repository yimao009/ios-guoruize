//
//  UserProfileListItemCell.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

final class UserProfileListItemCell<T: ListItemViewModel>: BaseTableViewCell<T> {
    private let userProfileListItemView: UserProfileListItemView<T>
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        userProfileListItemView = .init()

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(userProfileListItemView)
        userProfileListItemView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    override func update(_ viewModel: T) {
        userProfileListItemView.update(viewModel)
    }
}
