//
//  LoginViewModel.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class LoginViewModel {
    
    // - Delegate
    weak var delegate: LoginViewModelDelegate?
    
    // - Data
    private(set) var isPasswordHidden = true
    
}

// MARK: - Action
extension LoginViewModel {
    
    func updatePasswordDisplay() {
        isPasswordHidden.toggle()
    }
    
    func auth(email: String, password: String) {
        guard !email.isEmpty && !password.isEmpty && email.contains("@")  else { return }
        AuthStoreManager().auth(email: email, password: password) { [weak self] response, error in
            if error == nil {
                self?.delegate?.openMainScreen()
            }
        }
    }
    
}
