//
//  UpdateMomentLikeSession.swift
//  Moments
//
//  Created by guoruize on 2021/7/27.
//

import Foundation
import Alamofire
import RxSwift

protocol UpdateMomentLikeSessionType {
    func updateLike(_ isLiked: Bool, momentID: String, userID: String) -> Observable<MomentsDetails>
}

struct UpdateMomentLikeSession: UpdateMomentLikeSessionType {
    private struct Session: APISession {
        typealias ReponseType = Response

        let path = L10n.Development.graphqlPath
        let parameters: Parameters
        let headers: HTTPHeaders = .init()

        init(momentID: String, userID: String, isLiked: Bool) {
            let variables: [AnyHashable: Encodable] = ["momentID": momentID,
                                                       "userID": userID,
                                                       "isLiked": isLiked]
            parameters = ["query": Self.query,
                          "variables": variables]
        }

        fileprivate func post() -> Observable<Response> {
            post(path, parameters: parameters, headers: headers)
        }

        struct Response: Codable {
            let data: Data

            struct Data: Codable {
                let updateMomentLike: MomentsDetails
            }
        }

        private static let query = """
           mutation updateMomentLike($momentID: ID!, $userID: ID!, $isLiked: Boolean!){
             updateMomentLike(momentID: $momentID, userID: $userID, isLiked: $isLiked) {
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
                 isLiked,
                 likes
               }
             }
           }
        """
    }



    func updateLike(_ isLiked: Bool, momentID: String, userID: String) -> Observable<MomentsDetails> {
        let session = Session(momentID: momentID, userID: userID, isLiked: isLiked)
        return session.post().map {
            $0.data.updateMomentLike
        }
    }
}
