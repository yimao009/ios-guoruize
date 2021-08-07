//
//  ActionTrackingEventType.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation

protocol ActionTrackingEventType: TrackingEventType {
    var parameters: [String: Any] { get }
}
