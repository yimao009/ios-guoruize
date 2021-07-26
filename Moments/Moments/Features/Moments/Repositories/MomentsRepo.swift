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
    private let getMomentsByUserIDSessionBuilder: () -> GetMomentsByUserIDSessionType

    static var shared: MomentsRepo = {
        MomentsRepo {
            GetMomentsByUserIDSession()
        }
    }()

    init(getMomentsByUserIDAPISessionBuilder: @escaping () -> GetMomentsByUserIDSessionType) {
        self.getMomentsByUserIDSessionBuilder = getMomentsByUserIDAPISessionBuilder
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        getMomentsByUserIDSessionBuilder().getMoments(userID: userID)
    }
}
