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
    var title = L10n.InternalMenu.area51 // 页面标题
    var sections: Observable<[InternalMenuSection]> // 一共有多少个sections

    init(appRouter: InternalMenuRouting) {
        let appVersion = "\(L10n.InternalMenu.version) \((Bundle.main.object(forInfoDictionaryKey: L10n.InternalMenu.cfBundleVersion) as? String) ?? "1.0")"
        let appName = "\(L10n.InternalMenu.appName) \(Bundle.main.object(forInfoDictionaryKey: L10n.InternalMenu.cfBundleName) as? String ?? "0.0")"
        let infoSection = InternalMenuSection(
            title: L10n.InternalMenu.generalInfo,
            items: [
                InternalMenuDescriptionItemViewModel(title: appVersion),
                InternalMenuDescriptionItemViewModel(title: appName)
            ]
        )

        let designKitSection = InternalMenuSection(
            title: L10n.InternalMenu.designKitDemo,
            items: [
                DesignKitDemoItemViewModel(router: appRouter)
            ]
        )

        let featureTogglesSection = InternalMenuSection(
            title: L10n.InternalMenu.featureToggles,
            items: [InternalMenuLikeButtonToggleItemViewModel(toggleDataStore: TogglesDataStore.shared)])

        // 发送可观察序列
        sections = Observable.just([
            infoSection,
            designKitSection,
            featureTogglesSection
        ])
    }
}
