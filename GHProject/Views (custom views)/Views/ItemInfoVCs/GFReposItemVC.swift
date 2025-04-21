//
//  GFReposItemVC.swift
//  GHProject
//
//  Created by Софья Кравченко on 01.12.2024.
//

import UIKit

class GFReposItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureItems()
    }
    
    private func configureItems() {
        itemInfo1.setItemInfoType(itemType: .repos, with: user.publicRepos)
        itemInfo2.setItemInfoType(itemType: .gists, with: user.publicGists)
        actionButton.setBackgroundColor(backGroundColor: .systemPurple, tittle: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTappedGitHubProfileButton(for: user)
    }
}
