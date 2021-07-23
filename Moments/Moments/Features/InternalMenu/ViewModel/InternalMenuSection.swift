//
//  InternalMenuSection.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import RxDataSources

struct InternalMenuSection: SectionModelType {
    let title: String
    let items: [InternalMenuItemViewModel] //当前Section里有多少数据
    let footer: String?

    init(title: String, items: [InternalMenuItemViewModel], footer: String? = nil) {
        self.title = title
        self.items = items
        self.footer = footer
    }

    init(original: InternalMenuSection, items: [InternalMenuItemViewModel]) {
        self.init(title: original.title, items: items, footer: original.footer)
    }
}
