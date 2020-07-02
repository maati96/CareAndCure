//
//  AuthRouter.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 5/18/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import Foundation
import Alamofire

enum AuthRouter: URLRequestConvertible {
    
    case signup(username: String, email: String, password: String)
    case login(username: String, password: String)
    var method: HTTPMethod {
        switch self {
        case .signup:
            return .post
        case .login:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .signup(let username, let email, let password):
            return ["username": username, "email": email, "password": password]
        case .login(let username, let password):
            return ["username": username, "password": password]
        default:
            return nil
        }
        
    }
    
    var url: URL {
        let endpoint: String
        switch self {
        case .signup:
            endpoint = "http://codewithmaati.com/accounts/api/signup"
        case .login:
            endpoint = "http://codewithmaati.com/accounts/api/login"
        }
        return URL(string: endpoint)!
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .signup:
            return URLEncoding.httpBody
        case .login:
            return URLEncoding.httpBody
        }
    }
    
}


