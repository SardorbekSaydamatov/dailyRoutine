//
//  String+Extension.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import Foundation

extension String {
    func removeTrailingZeros() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2 
        if let number = formatter.number(from: self) {
            return formatter.string(from: number) ?? self
        }
        return self
    }
}
