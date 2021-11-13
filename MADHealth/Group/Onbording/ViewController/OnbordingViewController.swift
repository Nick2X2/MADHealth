//
//  OnbordingViewController.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

class OnbordingViewController: UIViewController {

    // - UI
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}

// MARK: - Action
private extension OnbordingViewController {
    
    @IBAction func skipButtonAction(_ sender: UIButton) {
        pushLoginVC()
    }
    
    func updatePage() {
        pageControl.currentPage = Int(scrollView.contentOffset.x / Screen.width)
    }
    
}

// MARK: - Navigation
private extension OnbordingViewController {
    
    func pushLoginVC() {
        let vc = UIStoryboard(storyboard: .login).instantiateInitialViewController()
        updateRootVC(vc!)
    }
    
}

// MARK: - UIScrollViewDelegate
extension OnbordingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updatePage()
    }
    
}

// MARK: - Configure
private extension OnbordingViewController {
    
    func configure() {
        UserDefaultsManager.shared.save(value: true, data: .onboardingIsShowed)
        scrollView.delegate = self
    }
    
}
