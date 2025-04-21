//
//  UIView+Ext.swift
//  GHProject
//
//  Created by Софья Кравченко on 09.12.2024.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
    
}
