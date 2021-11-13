//
//  HomeDataSource.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class HomeDataSource: NSObject {
    
    // - Init
    private let tableView: UITableView
    
    // - Delegate
    var delegate: HomeDelegate? {
        didSet {
            tableView.reloadData()
        }
    }
    
    // - Data
    private let viewModel: HomeViewModel
    
    // - Lifecycle
    init(tableView: UITableView, viewModel: HomeViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        configure()
    }
    
}

//MARK: - UITableView Data Source
extension HomeDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cardCell(cellForRowAt: indexPath)
    }

}

//MARK: - Cell
extension HomeDataSource {
    
    func cardCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.card.rawValue, for: indexPath) as! HomeCardTableViewCell
        cell.set(card: viewModel.cells[indexPath.row])
        return cell
    }
    
}

//MARK: - UITableView Delegate
extension HomeDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

//MARK: - Configure
private extension HomeDataSource {
    
    func configure() {
        setupDataSource()
    }
    
    func setupDataSource() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .init(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    enum Cell: String, CaseIterable {
        case card = "Card"
    }
    
}
