//
//  TrackingEvent.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation

// Can send any event name with any parameters
struct TrackingEvent: TrackingEventType {
    let name: String
    let parameters: [String: Any]
}
