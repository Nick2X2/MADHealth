//
//  HomeViewController.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
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
    
    @IBAction func logautButtonAction(_ sender: UIButton) {
        UserDefaultsManager.shared.clear()
        pushLoginVC()
    }
    
    func didTapOnSymptomGraph() {
        pushEmptyVC()
    }
    
    func didTapOnDiseaseHistory() {
        pushDiseaseHistoryVC()
    }
    
    func didTapOnTestResults() {
        pushEmptyVC()
    }
    
    func didTapOnChatWithDoctor() {
        pushEmptyVC()
    }
    
    func didTapOnUseDeviceSensors() {
        pushEmptyVC()
    }
    
}

// MARK: - Navigation
private extension HomeViewController {
    
    func pushEmptyVC() {
        let vc = UIStoryboard(storyboard: .empty).instantiateInitialViewController()
        push(vc: vc!)
    }
    
    func pushDiseaseHistoryVC() {
        let vc = UIStoryboard(storyboard: .diseaseHistory).instantiateInitialViewController()
        push(vc: vc!)
    }
    
    func pushLoginVC() {
        let vc = UIStoryboard(storyboard: .login).instantiateInitialViewController()
        updateRootVC(vc!)
    }
    
}

// MARK: - Configure
private extension HomeViewController {
    
    func configure() {
        configureDataSource()
        configureProfile()
    }
    
    func configureProfile() {
        let imageURL = UserDefaultsManager.shared.get(data: .profileImageURL)
        let name = UserDefaultsManager.shared.get(data: .profileName)
        profileImageView.sd_setImage(with: URL(string: imageURL))
        nameLabel.text = "👋🏻 Привет, \(name)!"
    }
    
    func configureDataSource() {
        dataSource = HomeDataSource(tableView: tableView, viewModel: viewModel)
        dataSource?.delegate = self
    }
    
}
