//
//  LoginViewModel.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class LoginViewModel {
    private(set) var isPasswordHidden = true
    
}

// MARK: - Action
extension LoginViewModel {
    
    func updatePasswordDisplay() {
        isPasswordHidden.toggle()
    }
    
}
