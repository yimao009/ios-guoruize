//
//  UnlikeActionTrackingEvent.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation
import FirebaseAnalytics

struct UnlikeActionTrackingEvent: ActionTrackingEventType {
    let momentID: String
    let userID: String
}

extension UnlikeActionTrackingEvent: FirebaseActionTrackingEvent {
    // swiftlint:disable no_hardcoded_strings
    var parameters: [String : Any] {
        return [
            AnalyticsParameterItemID: "moment-id-\(momentID)-user-id-\(userID)",
            AnalyticsParameterItemName: "moment-unlike"
        ]
    }
}
