//
//  GFBodyLabel.swift
//  GHProject
//
//  Created by Софья Кравченко on 20.11.2024.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlingment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlingment
    }
    
    private func configure() {
        textColor                         = .secondaryLabel
        font                              = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth         = true
        minimumScaleFactor                = 0.75
        lineBreakMode                     = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
