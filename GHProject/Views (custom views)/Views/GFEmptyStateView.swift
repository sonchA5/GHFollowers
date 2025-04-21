//
//  GFEmptyStateView.swift
//  GHProject
//
//  Created by Софья Кравченко on 28.11.2024.
//

import UIKit

class GFEmptyStateView: UIView {

    let messageLabel  = GFTittleLabel(textAlingment: .center, fontSize: 28)
    let logoImage     =  UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
   private func configure(){
       backgroundColor = .systemBackground
       
       addSubviews(messageLabel, logoImage)
       messageLabel.numberOfLines = 3
       messageLabel.textColor = .secondaryLabel
       
       logoImage.image = Images.ghEmptyState
       logoImage.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
        messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
        messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        messageLabel.heightAnchor.constraint(equalToConstant: 200),
        
        logoImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
        logoImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
        logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
        logoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 60)
       ])
    }
}

