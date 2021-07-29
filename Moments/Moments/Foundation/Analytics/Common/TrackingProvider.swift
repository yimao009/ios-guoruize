//
//  TrackingProvider.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation

protocol TrackingProvider {
    func trackScreenviews(_ event: TrackingEvent)
    func trackAction(_ event: TrackingEvent)
}
