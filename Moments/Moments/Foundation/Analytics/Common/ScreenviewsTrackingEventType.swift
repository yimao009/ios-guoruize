//
//  ScreenviewsTrackingEventType.swift
//  Moments
//
//  Created by guoruize on 2021/7/29.
//

import Foundation

protocol ScreenviewsTrackingEventType: TrackingEventType {
    var screenName: String { get }
    var screenClass: String { get }
}
