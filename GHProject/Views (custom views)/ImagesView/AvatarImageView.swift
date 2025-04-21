//
//  AvatarImageView.swift
//  GHProject
//
//  Created by Софья Кравченко on 26.11.2024.
//

import UIKit

class AvatarImageView: UIImageView {

    let cache = NetworkManager.shared.cache
    let avatarPlaceholderImage = Images.avatarImage
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 12
        clipsToBounds      = true
        translatesAutoresizingMaskIntoConstraints = false
        image = avatarPlaceholderImage
    }
            
}
