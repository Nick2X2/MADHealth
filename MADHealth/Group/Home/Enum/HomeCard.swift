//
//  HomeCard.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

enum HomeCard: CaseIterable {
    case symptomGraph
    case diseaseHistory
    case testResults
    case chatWithDoctor
    case useDeviceSensors
    
    var title: String {
        switch self {
            case .symptomGraph: return "График симптомов"
            case .diseaseHistory: return "История болезни"
            case .testResults: return "Результаты анализов"
            case .chatWithDoctor: return "Чат с доктором"
            case .useDeviceSensors: return "Использовать сенсоры устройства"
        }
    }
    
    var image: UIImage {
        switch self {
            case .symptomGraph: return #imageLiteral(resourceName: "symptomGraph")
            case .diseaseHistory: return #imageLiteral(resourceName: "diseaseHistory")
            case .testResults: return #imageLiteral(resourceName: "testResults")
            case .chatWithDoctor: return #imageLiteral(resourceName: "chatWithDoctor")
            case .useDeviceSensors: return #imageLiteral(resourceName: "useDeviceSensors")
        }
    }
}
