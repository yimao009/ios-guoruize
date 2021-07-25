//
//  APISession.swift
//  Moments
//
//  Created by guoruize on 2021/7/25.
//

import Foundation
import RxSwift

typealias Parameters = [String: Any]
typealias HTTPHeaders = [String: String]


public enum APISessionError: Error {
    case networkError
    case invalidJSON
    case noData
}

protocol APISession {
    // swiftlint:disable type_name
    associatedtype T: Codable
    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> Observable<T>
}


extension APISession {
    var baseURL: URL {
        API.baseURL
    }

    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            let url = baseURL.appendingPathComponent(path)

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    observer.onError(error) // 错误发送
                    return
                }

                guard let data = data else {
                    observer.onError(APISessionError.noData) // 没有数据
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    observer.onError(APISessionError.networkError)
                    return 
                }

                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(T.self, from: data)
                    observer.onNext(model)
                    observer.onCompleted()
                } catch {
                    observer.onError(APISessionError.invalidJSON)
                }
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }

}

