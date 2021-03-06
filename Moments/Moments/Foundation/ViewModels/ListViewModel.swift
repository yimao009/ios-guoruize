//
//  ListViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import Foundation
import RxSwift
import RxDataSources

protocol ListViewModel {
    var listItems: BehaviorSubject<[SectionModel<String, ListItemViewModel>]> { get }
    var hasContent: Observable<Bool> { get } // 通知UI是否有内容
    var hasError: BehaviorSubject<Bool> { get }

    func loadItems() -> Observable<Void>
    // Need the conformed class to implements
    func executeQuery() -> Observable<Void>
}

extension ListViewModel {
    /**
     这个方法使用map和distinctUntilChanged操作符来把listItems转换成 Bool
     类型的hasContent。
     其中map用于提取listItems里的数组并检查是否为空，
     distinctUntilChanged用来保证只有在值发生改变时才发送新事件。
     */
    var hasContent: Observable<Bool> {
        return listItems.map {
            $0.flatMap { $0.items }.isEmpty == false
        }.distinctUntilChanged()
    }

    func loadItems() -> Observable<Void> {
//        listItems.onNext([])
//        return executeQuery()
        executeQuery()
    }
}
