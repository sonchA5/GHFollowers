//
//  UIViewController+Ext.swift
//  GHProject
//
//  Created by Софья Кравченко on 22.11.2024.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController {
    func presentGFAlertOnMainThread(tittle: String, message: String, buttonTittle: String){
        DispatchQueue.main.async { 
            let alertVC = GFAlertVC(Tittle: tittle, message: message, buttonTittle: buttonTittle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle   = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC( with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemIndigo
        present(safariVC, animated: true)
        
    }
}
