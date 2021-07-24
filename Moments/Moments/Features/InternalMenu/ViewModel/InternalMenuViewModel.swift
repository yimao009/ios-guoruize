//
//  InternalMenuViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import RxSwift
import RxDataSources

protocol InternalMenuViewModelType {
    var title: String { get } // 页面标题
    var sections: Observable<[InternalMenuSection]> { get } // 多个sections模型数组
}

class InternalMenuViewModel: InternalMenuViewModelType {
    var title = "Area 51" // 页面标题
    var sections: Observable<[InternalMenuSection]> // 一共有多少个sections

    init(appRouter: InternalMenuRouting) {
        let appVersion = "Version \((Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String) ?? "1.0")"
        let appName = "AppName \(Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "Get Name Error")"
        let infoSection = InternalMenuSection(
            title: "General Info",
            items: [
                InternalMenuDescriptionItemViewModel(title: appVersion),
                InternalMenuDescriptionItemViewModel(title: appName)
            ]
        )

        let designKitSection = InternalMenuSection(
            title: "DesignKit Demo",
            items: [
                DesignKitDemoItemViewModel(router: appRouter)
            ]
        )

        // 发送可观察序列
        sections = Observable.just([
            infoSection,
            designKitSection
        ])
    }
}
