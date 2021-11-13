//
//  HomeDelegate.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation

protocol HomeDelegate: AnyObject {
    func didTapOnSymptomGraph()
    func didTapOnDiseaseHistory()
    func didTapOnTestResults()
    func didTapOnChatWithDoctor()
    func didTapOnUseDeviceSensors()
}
