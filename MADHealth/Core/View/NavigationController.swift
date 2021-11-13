//
//  NavigationController.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class NavigationController: UINavigationController {
    
    init(rootVC: UIViewController) {
        super.init(rootViewController: rootVC)
        setNavigationBarHidden(true, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNavigationBarHidden(true, animated: false)
    }
}
