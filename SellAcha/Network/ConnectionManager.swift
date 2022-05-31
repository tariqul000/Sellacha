//
//  ConnectionManager.swift
//  SellAcha
//
//  Created by Tariqul Islam on 31/5/22.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON

final class ConnectionManager {
    typealias ResponseCompletion = (_ result: Result) -> Void
    
    private(set) var request: DataRequest?
    
    private static let sessionManager: Session = {
       // var defaultHeaders = Alamofire.Session.default

        let configuration = URLSessionConfiguration.default
        ///configuration.httpAdditionalHeaders = defaultHeaders

        let manager = Session(configuration: configuration)
        return manager
    }()
    
   
    
    private init() { }
    
    static func request(url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> ConnectionManager {
        let newSelf = ConnectionManager()
        newSelf.request = sessionManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        return newSelf
    }
   
    static func request(with urlRequest: URLRequestConvertible) -> ConnectionManager {
        let newSelf = ConnectionManager()
        newSelf.request = sessionManager.request(urlRequest)
        return newSelf
    }
    
  
    
    @discardableResult
    func validate() -> Self {
        request = request?.validate()
        return self
    }
    
    @discardableResult
    func response(queue: DispatchQueue? = nil, completion: @escaping ResponseCompletion) -> Self {
        guard let request = request else {
            completion(.failure(error: RequestError.emptyRequest))
            return self
        }
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        request
            .validate()
            .responseAsJSON(queue: queue) { (response) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                switch response.result {
                case let .success(json):
                    completion(.successful(data: json))
                case let .failure(error):
                    let newError = ResponseError(httpStatusCode: response.response?.statusCode, errorResponseData: response.data, underlyingError: error)
                    completion(.failure(error: newError))
                }
        }
        return self
    }
    func cancel() {
        request?.cancel()
    }
}

extension ConnectionManager {
    
    enum Result {
        case successful(data: JSON)
        case failure(error: Error)
    }
    
    enum RequestError: Error {
        case emptyRequest
    }
    
    struct ResponseError: Error, CustomStringConvertible, CustomDebugStringConvertible {
        
        let httpStatusCode: Int?
        let errorResponseData: Data?
        let underlyingError: Error
        
        var errorResponseAsJSON: JSON? {
            
            guard let error = errorResponseData else {
                return nil
            }
            return try? JSON(data: error)
        }
        
        var errorResponse: Any? {
            
            guard let error = errorResponseData else {
                return nil
            }
            return try? JSONSerialization.jsonObject(with: error, options: .allowFragments)
        }
        
        var description: String {
            return underlyingError.localizedDescription
        }
        
        var debugDescription: String {
            return underlyingError.localizedDescription
        }
        
        init(httpStatusCode: Int?,
             errorResponseData: Data?,
             underlyingError: Error) {
            
            self.httpStatusCode = httpStatusCode
            self.errorResponseData = errorResponseData
            self.underlyingError = underlyingError
        }
    }
}

