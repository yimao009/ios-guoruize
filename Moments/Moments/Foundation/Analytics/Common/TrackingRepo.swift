//
//  TrackingRepo.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation

protocol TrackingRepoType {
    func register(trackingProvider: TrackingProvider)
    func trackScreenviews(_ event: TrackingEvent)
    func trackAction(_ event: TrackingEvent)
}

class TrackingRepo: TrackingRepoType {
    static let shared: TrackingRepo = .init()

    private var providers = [TrackingProvider]()

    private init() {}

    func register(trackingProvider: TrackingProvider) {
        providers.append(trackingProvider)
    }

    func trackScreenviews(_ event: TrackingEvent) {
        providers.forEach { $0.trackScreenviews(event)}
    }

    func trackAction(_ event: TrackingEvent) {
        providers.forEach { $0.trackAction(event) }
    }
}
