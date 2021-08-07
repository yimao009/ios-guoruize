//
//  LikeActionTrackingEvent.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation
import FirebaseAnalytics

struct LikeActionTrackingEvent: ActionTrackingEventType {
    let momentID: String
    let userID: String
}

extension LikeActionTrackingEvent: FirebaseActionTrackingEvent {
    var parameters: [String : Any] {
        return [
            AnalyticsParameterItemID: "moment-id-\(momentID)-user-id-\(userID)",
            AnalyticsParameterItemName: "moment-like"
        ]
    }
}
