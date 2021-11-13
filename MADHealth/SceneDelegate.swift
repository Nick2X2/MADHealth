//
//  SceneDelegate.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let window = (scene as? UIWindowScene) else { return }
        setupWindow(window)
        setupNavigationController()
    }

}

// MARK: - Setup
private extension SceneDelegate {
    
    func setupWindow(_ window: UIWindowScene) {
        self.window = UIWindow(windowScene: window)
        self.window?.overrideUserInterfaceStyle = .light
    }
    
    func setupNavigationController() {
        let onboardingIsShowed = UserDefaultsManager.shared.getBool(data: .onboardingIsShowed)
        let isAuth = UserDefaultsManager.shared.getBool(data: .isAuth)
        if isAuth {
            let vc = UIStoryboard(storyboard: .main).instantiateInitialViewController()
            let nc = NavigationController(rootVC: vc!)
            showWindow(nc: nc)
        } else if onboardingIsShowed == false {
            let vc = UIStoryboard(storyboard: .onbording).instantiateInitialViewController()
            let nc = NavigationController(rootVC: vc!)
            showWindow(nc: nc)
        } else {
            let vc = UIStoryboard(storyboard: .login).instantiateInitialViewController()
            let nc = NavigationController(rootVC: vc!)
            showWindow(nc: nc)
        }
    }
    
    func showWindow(nc: NavigationController) {
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
    
}

