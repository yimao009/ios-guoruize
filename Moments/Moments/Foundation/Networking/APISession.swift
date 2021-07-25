//
//  APISession.swift
//  Moments
//
//  Created by guoruize on 2021/7/25.
//

import Foundation
import Alamofire
import RxSwift

public enum APISessionError: Error {
    case networkError(error: Error, code: Int)
    case invalidJSON
    case noData
}

protocol APISession {
    // swiftlint:disable type_name
    associatedtype T: Codable
    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> Observable<T>
}

extension APISession {

    var defaultHeaders: HTTPHeaders {
        // swiftlint:disable no_hardcoded_strings
        let headers: HTTPHeaders = [
            "x-app-platform": "iOS",
            "x-app-version": UIApplication.appVersion,
            "x-os-version": UIDevice.current.systemVersion
        ]
        return headers
    }

    var baseURL: URL {
        API.baseURL
    }

    func post(_ path: String, parameters: Parameters? = nil, headers: HTTPHeaders = [:]) -> Observable<T> {
        return post(path, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
    }

}

private extension APISession {
    func post(_ path: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders) -> Observable<T> {
        let url = baseURL.appendingPathComponent(path)
        var allHeaders = defaultHeaders
        headers.forEach {  allHeaders.add($0) }

        return Observable.create { observer -> Disposable in
            let request = AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: allHeaders, interceptor: nil, requestModifier: nil)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? APISessionError.noData)
                            return
                        }
                        do {
                            let model = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(model)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode {
                            observer.onError(APISessionError.networkError(error: error, code: statusCode))
                        } else {
                            observer.onError(error)
                        }
                    }
                }

            return Disposables.create {
                request.cancel()
            }
        }

    }
}
