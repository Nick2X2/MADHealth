//
//  HistoryManager.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Moya

class HistoryManager {
    
    // - Provider
    private let authProvider = MoyaProvider<HistoryProvider>()
    
    func getHistory(completion: @escaping ((_ model: HistoryData?, _ error: Error?) -> ())) {
        authProvider.request(.getHistory) { (result) in
            handleResponse(result: result, completion: completion)
        }
    }
}
