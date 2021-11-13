//
//  HomeViewController.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var tableView: UITableView!
    
    // - Data source
    private var dataSource: HomeDataSource?

    // - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // - ViewModel
    private let viewModel = HomeViewModel()

}

// MARK: - HomeDelegate
extension HomeViewController: HomeDelegate {
    
    func didTapOnCard() {
        
    }
    
}

// MARK: - Configure
private extension HomeViewController {
    
    func configure() {
        configureDataSource()
    }
    
    func configureDataSource() {
        dataSource = HomeDataSource(tableView: tableView, viewModel: viewModel)
        dataSource?.delegate = self
    }
    
}
