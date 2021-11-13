//
//  DiseaseHistoryViewModel.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class DiseaseHistoryViewModel {
    
    // - Delegate
    weak var delegate: DiseaseHistoryDelegate?
    
    // - Data
    private(set) var data: [History] = []
    
}

// MARK: - Action
extension DiseaseHistoryViewModel {
    
    func getHistory() {
        HistoryManager().getHistory { [weak self] resptonse, error in
            if let data = resptonse?.data {
                self?.data = data
            }
            self?.delegate?.reloadData()
        }
    }
    
}
