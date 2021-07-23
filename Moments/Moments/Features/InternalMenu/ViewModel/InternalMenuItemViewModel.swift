//
//  InternalMenuItemViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import Foundation

/// Sectons里每一行所表示的类型
enum InternalMenuItemType: String {
    case description // 【通用信息】
    case featureToggle //【功能开关】
    case actionTrigger // 动作类型 
}

protocol InternalMenuItemViewModel {
    var type: InternalMenuItemType { get }

    func select()
}
