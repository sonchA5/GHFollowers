//
//  UIHelpers.swift
//  GHProject
//
//  Created by Софья Кравченко on 26.11.2024.
//

import UIKit

struct UIHelpers {
    
    static func createUICollectionViewFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let avaliableWidth = width - (padding + minimumItemSpacing)*2
        let itemWidth = avaliableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize     = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
}
