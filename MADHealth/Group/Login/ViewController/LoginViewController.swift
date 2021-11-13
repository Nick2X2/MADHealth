//
//  LoginViewController.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    // - UI
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // - Constraint
    @IBOutlet weak var passwordButtomConstraint: NSLayoutConstraint!
    
    // - Helper
    private var keyboardHelper: KeyboardHelper?

    // - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // - ViewModel
    private let viewModel = LoginViewModel()
    
}

// MARK: - Action
private extension LoginViewController {
    
    @IBAction func loginByNumberCodeButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func eyeButtonAction(_ sender: UIButton) {
        viewModel.updatePasswordDisplay()
        passwordTextField.isSecureTextEntry = viewModel.isPasswordHidden
        sender.tintColor = viewModel.isPasswordHidden ? #colorLiteral(red: 0.6274509804, green: 0.5843137255, blue: 0.7568627451, alpha: 1) : #colorLiteral(red: 0.3349039555, green: 0.2513573468, blue: 0.5784834027, alpha: 1)
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        viewModel.auth(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func registraitionButtonAction(_ sender: UIButton) {
    }
    
}

// MARK: - LoginViewModelDelegate
extension LoginViewController: LoginViewModelDelegate {
    
    func openMainScreen() {
        pushMainVC()
    }
    
}

// MARK: - Navigation
private extension LoginViewController {
    
    func pushMainVC() {
        let vc = UIStoryboard(storyboard: .main).instantiateInitialViewController()
        updateRootVC(vc!)
    }
    
}

// MARK: - Configure
private extension LoginViewController {
    
    func configure() {
        configureKeyboard()
        hideKeyboardWhenTappedAround()
        viewModel.delegate = self
        passwordTextField.isSecureTextEntry = viewModel.isPasswordHidden
    }
    
    func configureKeyboard() {
        keyboardHelper = KeyboardHelper { [weak self] (animation, size, time) in
            UIView.animate(withDuration: time) { [weak self] in
                guard let self = self else { return }
                switch animation {
                case .keyboardShown: self.passwordButtomConstraint.constant = size.height + 16
                case .keyboardHidden: self.passwordButtomConstraint.constant = 170
                }
                
                self.view.layoutIfNeeded()
            }
        }
    }
    
}
