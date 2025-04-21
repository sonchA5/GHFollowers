//
//  GFButton.swift
//  GHProject
//
//  Created by Софья Кравченко on 18.11.2024.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   convenience init(backgroundColor: UIColor, tittle: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(tittle, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius     = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font       = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setBackgroundColor(backGroundColor: UIColor, tittle: String) {
        self.backgroundColor = backGroundColor
        setTitle(tittle, for: .normal)
    }
    
}
