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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Action
private extension OnbordingViewController {
    
    @IBAction func skipButtonAction(_ sender: UIButton) {
    }
    
    func updatePage() {
        pageControl.currentPage = Int(scrollView.contentOffset.x / Screen.width)
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
        scrollView.delegate = self
    }
    
}
