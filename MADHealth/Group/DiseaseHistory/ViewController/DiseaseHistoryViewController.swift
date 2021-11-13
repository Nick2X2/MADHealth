//
//  DiseaseHistoryViewController.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class DiseaseHistoryViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // - Data source
    private var dataSource: DiseaseHistoryDataSource?

    // - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // - ViewModel
    private let viewModel = DiseaseHistoryViewModel()
    
}

// MARK: - Action
extension DiseaseHistoryViewController {
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        pop()
    }
    
}

// MARK: - DiseaseHistoryDelegate
extension DiseaseHistoryViewController: DiseaseHistoryDelegate {
    
    func reloadData() {
        emptyView.isHidden = viewModel.data.isEmpty == false
        dataView.isHidden = viewModel.data.isEmpty
        tableView.reloadData()
    }
    
}

// MARK: - Configure
private extension DiseaseHistoryViewController {
    
    func configure() {
        configureDataSource()
        viewModel.delegate = self
        viewModel.getHistory()
    }
    
    func configureDataSource() {
        dataSource = DiseaseHistoryDataSource(tableView: tableView, viewModel: viewModel)
    }
    
}
