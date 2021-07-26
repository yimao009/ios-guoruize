//
//  GetMomentsByUserIDSession.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import Foundation
import RxSwift
import Alamofire

protocol GetMomentsByUserIDSessionType {
    func getMoments(userID: String) -> Observable<MomentsDetails>
}

// swiftlint:disable no_hardcoded_strings
struct GetMomentsByUserIDSession: GetMomentsByUserIDSessionType {
    private struct Session: APISession {
        typealias ModeType = MomentsDetails

        let path = L10n.Development.graphqlPath
        let parameters: Parameters
        let headers: HTTPHeaders = .init()

        init(userID: String) {
            let variables: [AnyHashable: Encodable] = ["userID": userID]
            parameters = ["query": Session.query,
                          "variables": variables]
        }

        fileprivate func post() -> Observable<MomentsDetails> {
            return post(path, parameters: parameters, headers: headers)
        }

        private static let query = """
                       query getMomentsDetailsByUserID($userID: ID!){
                         getMomentsDetailsByUserID(userID: $userID) {
                           userDetails {
                             id
                             name
                             avatar
                             backgroundImage
                           }
                           moments {
                             id
                             userDetails {
                               name
                               avatar
                             }
                             type
                             title
                             photos
                             createdDate
                           }
                         }
                       }
        """
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        let session = Session(userID: userID)
        return session.post()
    }
}
