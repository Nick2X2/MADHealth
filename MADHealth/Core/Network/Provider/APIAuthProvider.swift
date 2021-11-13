//
//  APIAuthProvider.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Moya

enum APIAuthProvider {
    case auth(email: String, password: String)
}

extension APIAuthProvider: TargetType {
    
    var baseURL: URL {
        return URL(string: Constant.baseURL)!
    }
    
    var path: String {
        switch self {
            case .auth: return "/auth"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .auth:  return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .auth(let email, let password):
            let parameters = ["email": email,
                              "password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
}
