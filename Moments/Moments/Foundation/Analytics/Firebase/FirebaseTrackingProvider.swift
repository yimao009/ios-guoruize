//
//  FirebaseTrackingProvider.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation
import FirebaseAnalytics

struct FirebaseTrackingProvider: TrackingProvider {
    func trackScreenviews(_ event: TrackingEvent) {
        guard let event = event as? ScreenviewsTrackingEvent else {
            return
        }

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterScreenName: event.screenName,
            AnalyticsParameterScreenClass: event.screenClass])
    }

    func trackAction(_ event: TrackingEvent) {
        guard let event = event as? FirebaseActionTrackingEvent else {
            return
        }
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: event.parameters)
    }
}
