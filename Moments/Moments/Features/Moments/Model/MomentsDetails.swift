//
//  MomentsDetails.swift
//  Moments
//
//  Created by guoruize on 2021/7/25.
//

import Foundation

struct MomentsDetails: Codable {
    let userDetails: UserDetails
    let moments: [Moment]
}
