//
//  LoginRouter.swift
//  SellAcha
//
//  Created by Tariqul Islam on 31/5/22.
//


import Foundation
import Alamofire

enum LoginRouter: BaseRouter {
    
    case login(userID: String, password: String)

        var baseURL: URL {
        return AppConstant.baseURL
    }
   
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    var path: String {
        switch self {
        case .login:
            return "api/login"
        }
    }
    var queryStrings: [String : String]? {
        return nil
    }
    var parameters: Parameters? {
        switch self {
        case let .login(userID,password) :
            return  ["email":"\(userID)", "password": "\(password)"]
                   
        }
    }
    var headers: HTTPHeaders? {
        return [ "X-Requested-With": "XMLHttpRequest",
                 "Content-Type": "application/json",
                 "user-agent" : "ios"]
    }
    var encoder: ParameterEncoding? {
        return JSONEncoding.default
    }
}
