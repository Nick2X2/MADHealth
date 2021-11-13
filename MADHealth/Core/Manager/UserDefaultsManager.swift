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
        case profileImageURL = "profileImageURL"
        case profileName = "profileName"
    }
    
    func getBool(data: Data) -> Bool {
        return UserDefaults.standard.bool(forKey: data.rawValue)
    }
    
    func get(data: Data) -> String {
        return UserDefaults.standard.string(forKey: data.rawValue) ?? ""
    }
    
    func save(value: Bool, data: Data) {
        UserDefaults.standard.set(value, forKey: data.rawValue)
    }
    
    func save(value: String, data: Data) {
        UserDefaults.standard.set(value, forKey: data.rawValue)
    }
    
    func clear() {
        save(value: false, data: .isAuth)
        save(value: "", data: .profileImageURL)
        save(value: "", data: .profileName)
    }
    
}
