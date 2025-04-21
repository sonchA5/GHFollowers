//
//  Date+Ext.swift
//  GHProject
//
//  Created by Софья Кравченко on 02.12.2024.
//

import UIKit

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
