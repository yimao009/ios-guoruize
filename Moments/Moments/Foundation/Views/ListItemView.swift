//
//  ListItemView.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

protocol ListItemView: AnyObject {
    func update(with viewModel: ListItemViewModel)
}
