//
//  MomentsRepo.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import Foundation
import RxSwift

protocol MomentsRepoType {
    func getMoments(userID: String) -> Observable<MomentsDetails>
    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<MomentsDetails>
}

struct MomentsRepo: MomentsRepoType {

    private let getMomentsByUserIDSessionBuilder: () -> GetMomentsByUserIDSessionType
    private let updateMomentLikesSessionBuilder: () -> UpdateMomentLikeSessionType

    static var shared: MomentsRepo = MomentsRepo {
        GetMomentsByUserIDSession()
    } updateMomentLikesSessionBuilder: {
        UpdateMomentLikeSession()
    }


    init(getMomentsByUserIDAPISessionBuilder: @escaping () -> GetMomentsByUserIDSessionType,
         updateMomentLikesSessionBuilder: @escaping () -> UpdateMomentLikeSessionType) {
        self.getMomentsByUserIDSessionBuilder = getMomentsByUserIDAPISessionBuilder
        self.updateMomentLikesSessionBuilder = updateMomentLikesSessionBuilder
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        getMomentsByUserIDSessionBuilder().getMoments(userID: userID)
    }

    func updateLike(isLiked: Bool, momentID: String, from userID: String) -> Observable<MomentsDetails> {
        updateMomentLikesSessionBuilder().updateLike(isLiked, momentID: momentID, userID: userID)
    }
}
