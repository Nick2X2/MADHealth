//
//  AppDelegate.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit
import AlamofireNetworkActivityLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configure()
        return true
    }

}

// MARK: - Configure
private extension AppDelegate {
    
    func configure() {
        configureNetworkActivityLogger()
    }
    
    func configureNetworkActivityLogger() {
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
    }
    
}

