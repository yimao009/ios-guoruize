//
//  ListItemCell.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

protocol ListItemCell {
    associatedtype ViewModel
    func update(with viewModel: ViewModel)
}
