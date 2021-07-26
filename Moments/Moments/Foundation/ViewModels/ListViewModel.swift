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

    var hasContent: Observable<Bool> { get }

    func load() -> Observable<Void>
    // Need the conformed class to implements
    func executeQuery() -> Observable<Void>
}


extension ListViewModel {
    var hasContent: Observable<Bool> {
        return listItems.map {
            $0.flatMap { $0.items }.isEmpty == false
        }.distinctUntilChanged()
    }

    func load() -> Observable<Void> {
        listItems.onNext([SectionModel(model: "", items: [])])
        return executeQuery()
    }
}
