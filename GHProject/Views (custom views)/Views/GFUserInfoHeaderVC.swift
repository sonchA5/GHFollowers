//
//  GFUserInfoHeaderVC.swift
//  GHProject
//
//  Created by Софья Кравченко on 01.12.2024.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    let usernameLabel  = GFTittleLabel(textAlingment: .left, fontSize: 34)
    let userInfo     = GFBodyLabel(textAlingment: .left)
    let nameLabel = GFSecondaryLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let userLocation   = GFSecondaryLabel(fontSize: 18)
    let avatarImage    = AvatarImageView(frame: .zero)
    
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
        addSubviews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        downloadAvatarImage()
        usernameLabel.text = user.login
        nameLabel.text     = user.name ?? ""
        
        locationImageView.image    = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        
        userLocation.text       = user.location ?? "No location"
        userInfo.text           = user.bio ?? "No bio available"
        userInfo.numberOfLines  = 3
        
    }
    
    func downloadAvatarImage() {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
            guard let self = self else {return}
            DispatchQueue.main.async { self.avatarImage.image = image }
        }
    }
     
    func addSubviews() {
        view.addSubviews(avatarImage, usernameLabel, nameLabel, locationImageView, userLocation, userInfo) }
 
    func layoutUI() {
        let padding: CGFloat = 20
        let textimagePadding: CGFloat = 20
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImage.heightAnchor.constraint(equalToConstant: 90),
            avatarImage.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: textimagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: textimagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: textimagePadding),
            locationImageView.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            
            userLocation.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            userLocation.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userLocation.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            userLocation.heightAnchor.constraint(equalToConstant: 20),
            
            userInfo.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: textimagePadding),
            userInfo.leadingAnchor.constraint(equalTo: avatarImage.leadingAnchor),
            userInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfo.heightAnchor.constraint(equalToConstant: 90)
            
        ])
    }
}
