//
//  TreatmentRouter.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 6/27/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import Foundation
import Alamofire

enum TreatmentRouter: URLRequestConvertible {
    
    case allTreatment
    case treatmentDetail(id: Int)
    var method: HTTPMethod {
        switch self {
        case .allTreatment:
            return .get
        case .treatmentDetail:
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .treatmentDetail(let id):
            return ["id": id]
        default:
            return nil
        }
        
    }
    var url: URL {
        let endpoint: String
        switch self {
        case .allTreatment:
            endpoint = "http://codewithmaati.com/treatment/api/all"
        case .treatmentDetail:
            endpoint = "http://codewithmaati.com/treatment/api/detail"
        }
        return URL(string: endpoint)!
    }
    var encoding: ParameterEncoding {
        switch self {
        case .allTreatment:
            return URLEncoding.queryString
        case .treatmentDetail:
            return URLEncoding.default
        }
    }
    
}



