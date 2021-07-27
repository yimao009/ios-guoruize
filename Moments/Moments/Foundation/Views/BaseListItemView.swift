//
//  BaseListItemView.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

class BaseListItemView: UIView, ListItemView {
    // Implemented by conformed class
    // swiftlint:disable unavailable_function
    func update(with viewModel: ListItemViewModel) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
