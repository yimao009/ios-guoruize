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
}

struct MomentsRepo: MomentsRepoType {

    private let getMomentsByUserIDAPISessionBuilder: () -> GetMomentsByUserIDAPISessonType

    static var shared: MomentsRepo = {
        MomentsRepo {
            GetMomentsByUserIDAPISession()
        }
    }()

    init(getMomentsByUserIDAPISessionBuilder: @escaping () -> GetMomentsByUserIDAPISessonType) {
        self.getMomentsByUserIDAPISessionBuilder = getMomentsByUserIDAPISessionBuilder
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        getMomentsByUserIDAPISessionBuilder().getMoments(userID: userID)
    }

}
