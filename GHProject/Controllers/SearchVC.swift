//
//  SearchVC.swift
//  GHProject
//
//  Created by Софья Кравченко on 18.11.2024.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView     = UIImageView()
    let usernameTextField = GHTextfield()
    let confirmButton     = GFButton(backgroundColor: .systemIndigo, tittle: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, usernameTextField, confirmButton)
        configureImageView()
        configureTextField()
        configureConfirmButton()
        createdismissKeyboardTapGesture()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)  
    }
    
    func createdismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
  @objc func pushFollowerListVC() {
      guard isUsernameEntered else {
          presentGFAlertOnMainThread(tittle: "Empty Username", message: "Please, enter an username, we need to know who to look for", buttonTittle: "OK")
          return
          }
      
      usernameTextField.resignFirstResponder()
      
      let followerListVC    = FollowerListVC(username: usernameTextField.text!)
      navigationController?.pushViewController(followerListVC, animated: true)
    }

    func configureImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = Images.ghLogo
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
    }
    
    func configureConfirmButton() {
        confirmButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 80),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            confirmButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
