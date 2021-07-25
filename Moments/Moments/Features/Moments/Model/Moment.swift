//
//  Moment.swift
//  Moments
//
//  Created by guoruize on 2021/7/25.
//

import Foundation

struct Moment {
    let id: String
    let userDetails: UserDetails
    let type: MomentType
    let title: String?
    let url: String?
    let photos: [String]
    let createdDate: String
}
