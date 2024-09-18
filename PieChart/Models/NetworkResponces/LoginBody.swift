//
//  NetworkResponces.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 13/09/24.
//

import Foundation

struct LoginBody: Codable {
    let username: String
    let email: String
    let password: String
}
