//
//  UserDefaultsPersistentDataStore.swift
//  Moments
//
//  Created by guoruize on 2021/7/27.
//

import Foundation
import RxSwift

struct UserDefaultsPersistentDataStore: PersistentDataStoreType {
    static let shared: UserDefaultsPersistentDataStore = .init()

    private(set) var momentsDetail: BehaviorSubject<MomentsDetails?> = .init(value: nil)
    private let disposeBage: DisposeBag = .init()
    private let defaults = UserDefaults.standard
    private let momentsDetailsKey = String(describing: MomentsDetails.self)

    private init() {
        setupBindings()
    }

    func save(momentsDetails: MomentsDetails) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(momentsDetails) {
            defaults.set(encoded, forKey: momentsDetailsKey)
        }
    }
}

private extension UserDefaultsPersistentDataStore {
    func setupBindings() {
        defaults.rx
            .observe(Data.self, momentsDetailsKey)
            .compactMap { $0 }
            .map { try? JSONDecoder().decode(MomentsDetails.self, from: $0)}
            .compactMap { $0 }
            .subscribe {
                momentsDetail.onNext($0)
            }
            .disposed(by: disposeBage)
    }
}
