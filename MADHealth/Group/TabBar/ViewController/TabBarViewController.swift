//
//  TabBarViewController.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}

// MARK: - Configure
extension TabBarViewController {
    
    func configure() {
        configureTabBarItemsColor()
    }
    
    func configureTabBarItemsColor() {
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: AppColor.main], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: AppColor.ink04], for: .normal)
        UITabBar.appearance().unselectedItemTintColor = AppColor.ink04
    }
    
}
