//
//  Storyboard.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

enum Storyboard: String {
    
    case onbording = "Onbording"
    case login = "Login"
    case tabBar = "TabBar"
    case empty = "Empty"
    case diseaseHistory = "DiseaseHistory"
    
    var name: String {
        return rawValue
    }
    
}

