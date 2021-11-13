//
//  AuthStoreManager.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Moya

class AuthStoreManager {
    
    // - Provider
    private let addressProvider = MoyaProvider<APIAuthProvider>()
    
    func auth(email: String, password: String, completion: @escaping ((_ model: EmptyModel?, _ error: Error?) -> ())) {
        addressProvider.request(.auth(email: email, password: password)) { (result) in
            handleResponse(result: result, completion: completion)
        }
    }
}
