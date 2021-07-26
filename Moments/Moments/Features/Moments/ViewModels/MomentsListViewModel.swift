//
//  MomentsListViewModel.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import Foundation
import RxSwift
import RxDataSources

struct MomentsListViewModel: ListViewModel {
    var listItems: BehaviorSubject<[SectionModel<String, ListItemViewModel>]> = .init(value: [])

    private let userID: String
    private let momentsRepo: MomentsRepoType

    init(userID: String,
         momentsRepo: MomentsRepoType) {
        self.userID = userID
        self.momentsRepo = momentsRepo
    }

    func executeQuery() -> Observable<Void> {
        return momentsRepo.getMoments(userID: userID)
            .observeOn(MainScheduler.instance)
            .map {
                onQueryExecuteSuccess(momentsDetails: $0)
            }
            .catchError { error in
                onQueryExecuteFailure(error: error)
                return Observable.just(())
            }
            .share()

    }
}

private extension MomentsListViewModel {
    func onQueryExecuteSuccess(momentsDetails: MomentsDetails) {
        let items: [ListItemViewModel] = [
            UserProfileListItemViewModel(userDetails: momentsDetails.userDetails)
        ]
        listItems.onNext([SectionModel(model: "", items: items)])
    }

    func onQueryExecuteFailure(error: Error) {
        listItems.onError(error)
    }
}
