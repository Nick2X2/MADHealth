//
//  UserDefaultsManager.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    enum Data: String {
        case onboardingIsShowed = "onboardingIsShowed"
        case isAuth = "isAuth"
    }
    
    func getBool(data: Data) -> Bool {
        return UserDefaults.standard.bool(forKey: data.rawValue)
    }
    
    func save(value: Bool, data: Data) {
        UserDefaults.standard.set(value, forKey: data.rawValue)
    }
    
}
