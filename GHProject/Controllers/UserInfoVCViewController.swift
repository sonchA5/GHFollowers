//
//  UserInfoVCViewController.swift
//  GHProject
//
//  Created by Софья Кравченко on 29.11.2024.
//

import UIKit

protocol UserInfoVCViewControllerDelegate: AnyObject  {
    func didTappedGitHubProfileButton(for user: User)
    func didTappedGetFollowers(for user: User)
}

class UserInfoVCViewController: GFDataLoadingVC {

    var username: String!
    weak var delegate: FollowerListVCDelegate!
   let headerView = UIView()
    let itemView1 = UIView()
    let itemView2 = UIView()
    let dateLabel = GFBodyLabel(textAlingment: .center)
    var ItemsViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layoutUI()
        getUserInfo()
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissUserInfo))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo(){
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else {return}
            switch result{
            case.success(let user):
                DispatchQueue.main.async{ 
                    self.configureUIelements(with: user)
                }
            case.failure(let error):
                self.presentGFAlertOnMainThread(tittle: "Something went wrong😔", message: error.rawValue, buttonTittle: "Ok")
            }
        }
    }
    
    func configureUIelements(with user: User) {
        let repoItemVC = GFReposItemVC(user: user)
        repoItemVC.delegate = self
        let followerItemVC = GFFollowersItemVC(user: user)
        followerItemVC.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: repoItemVC, to: self.itemView1)
        self.add(childVC: followerItemVC, to: self.itemView2)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    func layoutUI() {
        ItemsViews = [headerView, itemView1, itemView2, dateLabel]
        let padding: CGFloat = 20
        for item in ItemsViews{
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemView1.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: padding),
            itemView1.heightAnchor.constraint(equalToConstant: 150),

            itemView2.topAnchor.constraint(equalTo: itemView1.bottomAnchor, constant: padding),
            itemView2.heightAnchor.constraint(equalToConstant: 150),
            
            dateLabel.topAnchor.constraint(equalTo: itemView2.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}

extension UserInfoVCViewController: UserInfoVCViewControllerDelegate {
    func didTappedGitHubProfileButton(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(tittle: "Invalid URL", message: "URL attached to this user is invalid", buttonTittle: "Ok")
            return
        }
      presentSafariVC(with: url)
    }
    
    func didTappedGetFollowers(for user: User) {
        delegate.didRequestFollowers(for: user.login)
    }
}
