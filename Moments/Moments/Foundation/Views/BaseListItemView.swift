//
//  BaseListItemView.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

class BaseListItemView<VM: ListItemViewModel>: UIView {
    // swiftlint:disable unavailable_function
    func update(_ viewModel: VM) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
