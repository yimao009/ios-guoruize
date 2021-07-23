//
//  InternalMenuViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import RxSwift
import RxDataSources

protocol InternalMenuViewModelType {
    var title: String { get } // section 标题
    var sections: Observable<[InternalMenuSection]> { get } // 多个sections模型数组
}

class InternalMenuViewModel: InternalMenuViewModelType {
    var title = "Area 51" // 页面标题
    var sections: Observable<[InternalMenuSection]> // 一共有多少个sections

    init(appRouter: AppRouting) {
        let appVersion = "Version \((Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String) ?? "1.0")"
        let infoSection = InternalMenuSection(
            title: "General Info",
            items: [InternalMenuDescriptionItemViewModel(title: appVersion)]
        )

        // 发送可观察序列
        sections = .just([
            infoSection
        ])
    }
}
