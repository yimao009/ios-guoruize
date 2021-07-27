//
//  MomentsRepo.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import Foundation
import RxSwift

protocol MomentsRepoType {
    var momentsDetails: PublishSubject<MomentsDetails> { get }

    func getMoments(userID: String) -> Observable<Void>
    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<MomentsDetails>
}

struct MomentsRepo: MomentsRepoType {
    private(set) var momentsDetails: PublishSubject<MomentsDetails> = .init()
    private let disposeBag: DisposeBag = .init()

    private let persistentDataStore: PersistentDataStoreType
    private let getMomentsByUserIDSessionBuilder: () -> GetMomentsByUserIDSessionType
    private let updateMomentLikesSessionBuilder: () -> UpdateMomentLikeSessionType

    static var shared: MomentsRepo = MomentsRepo(persistentDataStore: UserDefaultsPersistentDataStore.shared) {
        GetMomentsByUserIDSession()
    } updateMomentLikesSessionBuilder: {
        UpdateMomentLikeSession()
    }

    private init(persistentDataStore: PersistentDataStoreType,
         getMomentsByUserIDAPISessionBuilder: @escaping () -> GetMomentsByUserIDSessionType,
         updateMomentLikesSessionBuilder: @escaping () -> UpdateMomentLikeSessionType) {
        self.persistentDataStore = persistentDataStore
        self.getMomentsByUserIDSessionBuilder = getMomentsByUserIDAPISessionBuilder
        self.updateMomentLikesSessionBuilder = updateMomentLikesSessionBuilder
    }

    func getMoments(userID: String) -> Observable<Void> {
        return getMomentsByUserIDSessionBuilder().getMoments(userID: userID)
            .do(onNext: {
                persistentDataStore.save(momentsDetails: $0)
                momentsDetails.onNext($0)
            })
            .map { _ in () }
            .catchErrorJustReturn(())
    }

    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<MomentsDetails> {
        updateMomentLikesSessionBuilder().updateLike(isLiked, momentID: momentID, userID: userID)
    }
}
