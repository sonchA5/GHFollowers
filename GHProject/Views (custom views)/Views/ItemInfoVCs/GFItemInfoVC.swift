//
//  GFItemInfoVC.swift
//  GHProject
//
//  Created by Софья Кравченко on 01.12.2024.
//

import UIKit

//protocol UserInfoVCViewControllerDelegate: AnyObject  {
//    func didTappedGitHubProfileButton(for user: User)
//    func didTappedGetFollowers(for user: User)
//}

class GFItemInfoVC: UIViewController {

    let stackView = UIStackView()
    let itemInfo1 = GFItemInfoView()
    let itemInfo2 = GFItemInfoView()
    let actionButton = GFButton()
    
    weak var delegate: UserInfoVCViewControllerDelegate!
    var user: User!
    
     init(user: User) {
         super.init(nibName: nil, bundle: nil)
         self.user = user
         
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackView()
        configureActionButton()
    }
    
    func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }

    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    @objc func actionButtonTapped() {
        
    }
    private func layoutUI() {
        view.addSubviews(stackView, actionButton)
   
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemInfo1)
        stackView.addArrangedSubview(itemInfo2)
    }
}
