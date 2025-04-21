//
//  GFFollowersItemVC.swift
//  GHProject
//
//  Created by Софья Кравченко on 01.12.2024.
//

import Foundation

class GFFollowersItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfo1.setItemInfoType(itemType: .followers, with: user.followers)
        itemInfo2.setItemInfoType(itemType: .following, with: user.following)
        actionButton.setBackgroundColor(backGroundColor: .systemIndigo, tittle: "Get Followers")
    }
    
    override func actionButtonTapped() {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(tittle: "No Followers", message: "This user has no followers. What a shame...", buttonTittle: "So sad")
            return
        }
        delegate.didTappedGetFollowers(for: user)
        dismiss(animated: true)
    }
}

