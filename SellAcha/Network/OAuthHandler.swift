//
//  OAuthHandler.swift
//  SellAcha
//
//  Created by Tariqul Islam on 31/5/22.
//

import Foundation
import Alamofire

final class OAuthHandler {
    
    private let lock = NSLock()
    private typealias RefreshCompletion = (_ succeeded: Bool) -> Void
    private var isRefreshing = false
    
    private func refreshTokens(completion: @escaping RefreshCompletion) {
        
        guard let urlRequest = try? LoginRouter.login(userID: "minoue", password: "minoue").asURLRequest() else {
            completion(false)
            return
        }
        
        isRefreshing = true
        
        ConnectionManager
            .request(with: urlRequest)
            .response { [weak self] (result) in
                self?.isRefreshing = false
                
                switch result {
                case let .successful(json):
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        guard  let payload = json["payload"].array?.first,
                            let rawData = try? payload.rawData() else {
                                
                                completion(false)
                                return
                        }
                        
                        let newCredentials = try jsonDecoder.decode(AuthenticationDataModel.self, from: rawData)
                        AppSession.shared.updateCredentials(with: newCredentials)
                        completion(true)
                        
                    } catch {
                        completion(false)
                    }
                    
                case .failure(_):
                    completion(false)
                }
        }
    }
}


extension OAuthHandler: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        guard (urlRequest.url?.absoluteString) != nil else {
            return urlRequest
        }
        
        var urlRequest = urlRequest
        guard let authenticationData = AppSession.shared.authenticationData else {
            return urlRequest
        }
        let token = "Bearer \(authenticationData.accessToken)"
        urlRequest.setValue(token, forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
}

extension OAuthHandler: RequestRetrier {
    
    func should(_ manager: SessionManager,
                retry request: Request,
                with error: Error,
                completion: @escaping RequestRetryCompletion) {
        
        lock.lock()
        defer { lock.unlock() }
        
        guard request.retryCount < 2,
            let response = request.task?.response as? HTTPURLResponse else {
                completion(false, 0.0)
                return
        }
        
        guard response.statusCode == 401 else {
            completion(false, 0.0)
            return
        }
        
        requestsToRetry.append(completion)
        guard !isRefreshing else { return }
        
        refreshTokens { [weak self] (succeeded) in
            self?.lock.lock()
            defer { self?.lock.unlock() }
            
            self?.requestsToRetry.forEach { $0(succeeded, 0.0) }
            self?.requestsToRetry.removeAll()
            
            if !succeeded {
                AppSession.shared.logout()
            }
        }
    }
}
