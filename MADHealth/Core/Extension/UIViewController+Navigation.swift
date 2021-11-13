//
//  UIViewController+Navigation.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

extension UIViewController {
    
    func dismiss() {
        dismiss(animated: true)
    }
    
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func pop(to vc: UIViewController, animated: Bool = true) {
        navigationController?.popToViewController(vc, animated: animated)
    }
    
    func setNavigationBarHidden(_ isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: false)
    }
    
    func push(vc: UIViewController, animated: Bool = true) {
        tabBarController?.tabBar.isHidden = false
        vc.hidesBottomBarWhenPushed = false
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    func updateRootVC(_ vc: UIViewController, animated: Bool = true) {
        navigationController?.setViewControllers([vc], animated: animated)
    }
    
}
