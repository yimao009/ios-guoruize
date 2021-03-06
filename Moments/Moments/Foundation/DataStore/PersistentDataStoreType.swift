//
//  PersistentDataStoreType.swift
//  Moments
//
//  Created by guoruize on 2021/7/27.
//

import Foundation
import RxSwift

protocol PersistentDataStoreType {
    var momentsDetail: BehaviorSubject<MomentsDetails?> { get }

    func save(momentsDetails: MomentsDetails)
}
