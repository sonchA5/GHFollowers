//
//  GFAlertVC.swift
//  GHProject
//
//  Created by Софья Кравченко on 20.11.2024.
//

import UIKit

class GFAlertVC: UIViewController {

    let containerView = GFContainerView()
    let tittleLabel   = GFTittleLabel(textAlingment: .center, fontSize: 20)
    let bodyLabel     = GFBodyLabel(textAlingment: .center)
    let actionButton  = GFButton(backgroundColor: .systemMint, tittle: "Okay")
    
    var alertTittle: String?
    var message: String?
    var buttonTittle: String?
    
    let padding: CGFloat = 20
    
    init(Tittle: String, message: String, buttonTittle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTittle  = Tittle
        self.message      = message
        self.buttonTittle = buttonTittle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(containerView, tittleLabel, actionButton, bodyLabel)
        configureContainerView()
        configureTittleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    func configureContainerView() {
     
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureTittleLabel() {
        tittleLabel.text = alertTittle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            tittleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            tittleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            tittleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            tittleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton() {
        actionButton.setTitle(buttonTittle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func dismissAlert() {
        dismiss(animated: true)
    }
    
    func configureBodyLabel() {
        bodyLabel.text = message ?? "Unable to complete request"
        bodyLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: tittleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
}
