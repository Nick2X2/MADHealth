//
//  HomeViewModel.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

class HomeViewModel {
    let cells: [HomeCard] = HomeCard.allCases.map { $0 }
}
