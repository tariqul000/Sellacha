//
//  BaseRouter.swift
//  SellAcha
//
//  Created by Tariqul Islam on 31/5/22.
//

import Foundation
import Alamofire

protocol BaseRouter: URLRequestConvertible {
    
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var queryStrings: [String: String]? { get }
    var parameters: Parameters? { get }
    var fullURL: URL? { get }
    var headers: HTTPHeaders? { get }
    var encoder: ParameterEncoding? { get }
}

extension BaseRouter {
    
    var fullURL: URL? {
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        urlComponents.path = "\(path)"
        urlComponents.queryItems = queryStrings?.map { URLQueryItem(name: $0, value: $1) }
        
        guard let url = urlComponents.url else {
            return nil
        }
        return url
    }
    
    func asURLRequest() throws -> URLRequest {
        
        guard let fullURL = fullURL else {
            throw AFError.invalidURL(url: baseURL)
        }
        var urlRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 30
        
        //headers?.forEach({ urlRequest.addValue($1, forHTTPHeaderField: $0) })
        
        let doesMethodHasHTTPBody = (method != .get && method != .connect && method != .head && method != .options && method != .trace)
        
        guard doesMethodHasHTTPBody else {
            return urlRequest
        }
        guard let encoder = encoder else {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            return urlRequest
        }
        urlRequest = try encoder.encode(urlRequest, with: parameters)
        return urlRequest
    }
}
