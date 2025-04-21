//
//  GFDataLoadingVC.swift
//  GHProject
//
//  Created by Софья Кравченко on 08.12.2024.
//

import UIKit

class GFDataLoadingVC: UIViewController {
    
    var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func showLoadingView(){
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha           = 0
        
        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.8
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    func dismissLoadingView(){
        DispatchQueue.main.async{
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    @objc func dismissUserInfo() {
        dismiss(animated: true)
    }
    
    func showEmptyStateView(with message: String, in view: UIView){
        let emptyState = GFEmptyStateView(message: message)
        emptyState.frame = view.bounds
        view.addSubview(emptyState)
    }

}
