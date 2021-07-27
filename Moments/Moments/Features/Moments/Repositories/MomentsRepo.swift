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
    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<Void>
}

struct MomentsRepo: MomentsRepoType {
    private(set) var momentsDetails: PublishSubject<MomentsDetails> = .init()

    private let getMomentsByUserIDSessionBuilder: () -> GetMomentsByUserIDSessionType
    private let updateMomentLikesSessionBuilder: () -> UpdateMomentLikeSessionType

    static var shared: MomentsRepo = MomentsRepo {
        GetMomentsByUserIDSession()
    } updateMomentLikesSessionBuilder: {
        UpdateMomentLikeSession()
    }

    private init(getMomentsByUserIDAPISessionBuilder: @escaping () -> GetMomentsByUserIDSessionType,
         updateMomentLikesSessionBuilder: @escaping () -> UpdateMomentLikeSessionType) {
        self.getMomentsByUserIDSessionBuilder = getMomentsByUserIDAPISessionBuilder
        self.updateMomentLikesSessionBuilder = updateMomentLikesSessionBuilder
    }

    func getMoments(userID: String) -> Observable<Void> {
        return getMomentsByUserIDSessionBuilder().getMoments(userID: userID)
            .do(onNext: {momentsDetails.onNext($0)})
            .map { _ in () }
            .catchErrorJustReturn(())
    }

    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<Void> {
        updateMomentLikesSessionBuilder()
            .updateLike(isLiked, momentID: momentID, userID: userID)
            .do(onNext: { momentsDetails.onNext($0) })
            .map{ _ in () }
            .catchErrorJustReturn(())
    }
}
