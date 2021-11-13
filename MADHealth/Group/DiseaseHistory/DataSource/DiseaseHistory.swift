//
//  DiseaseHistoryDataSource.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class DiseaseHistoryDataSource: NSObject {
    
    // - Init
    private let tableView: UITableView
    
    // - Data
    private let viewModel: DiseaseHistoryViewModel
    
    // - Lifecycle
    init(tableView: UITableView, viewModel: DiseaseHistoryViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        configure()
    }
    
}

//MARK: - UITableView Data Source
extension DiseaseHistoryDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cardCell(cellForRowAt: indexPath)
    }

}

//MARK: - Cell
extension DiseaseHistoryDataSource {
    
    func cardCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.card.rawValue, for: indexPath) as! HistoryCardTableViewCell
        cell.set(history: viewModel.data[indexPath.row])
        return cell
    }
    
}

//MARK: - UITableView Delegate
extension DiseaseHistoryDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2) {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.transform = .init(scaleX: 0.92, y: 0.92)
            }
        }
    }
        
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3, animations: {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.transform = .identity
            }
        })
    }
    
}

//MARK: - Configure
private extension DiseaseHistoryDataSource {
    
    func configure() {
        setupDataSource()
    }
    
    func setupDataSource() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .init(top: 8, left: 0, bottom: 40, right: 0)
    }
    
    enum Cell: String, CaseIterable {
        case card = "Card"
    }
    
}
