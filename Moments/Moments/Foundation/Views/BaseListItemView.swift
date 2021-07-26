//
//  BaseListItemView.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

class BaseListItemView<VM: ListItemViewModel>: UIView, ListItemView {
    typealias ViewModel = VM

    // Implemented by conformed class
    // swiftlint:disable unavailable_function
    func update(with viewModel: VM) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }
}
