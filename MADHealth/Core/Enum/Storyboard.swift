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
    case main = "Main"
    
    var name: String {
        return rawValue
    }
    
}

