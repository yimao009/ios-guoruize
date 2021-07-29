//
//  ActionTrackingEvent.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation

protocol ActionTrackingEvent: TrackingEvent {
    var parameters: [String: Any] { get }
}
