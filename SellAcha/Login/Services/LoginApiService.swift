//
//  LoginApiServiceProtocol.swift
//  SellAcha
//
//  Created by Tariqul Islam on 31/5/22.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol LoginApiServiceProtocol {
    
    func login(with userID: String, password: String  ,completion: @escaping ((Bool, Error?) -> Void))

}

class LoginApiService: LoginApiServiceProtocol {
    
    private lazy var jsonDecoder = JSONDecoder()
    
    func login(with userID: String, password: String, completion: @escaping ((Bool, Error?) -> Void)) {
        
        guard let urlRequest = try? LoginRouter.login(userID: userID, password: password).asURLRequest() else {
            completion(false, URLError(.badURL))
            return
        }
        
        let request = ConnectionManager.request(with: urlRequest)
        request.response {[weak self] (result) in
            
            switch result {
            case let .successful(json):
            
                guard  let payload = json["payload"].array?.first,
                    let rawData = try? payload.rawData(),
                    let strongSelf = self else {
                        completion(false, URLError(.badServerResponse))
                        return
                }
                
                /* Store Login Authentication data **/
              
                completion(true, nil)
                
            case let .failure(error):
                completion(false, error)
            }
        }
    }
}
