//
//  HistoryProvider.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Moya

enum HistoryProvider {
    case getHistory
}

extension HistoryProvider: TargetType {
    
    var baseURL: URL {
        return URL(string: Constant.baseURL)!
    }
    
    var path: String {
        switch self {
            case .getHistory: return "/history"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .getHistory: return .get
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
        case .getHistory:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
}
