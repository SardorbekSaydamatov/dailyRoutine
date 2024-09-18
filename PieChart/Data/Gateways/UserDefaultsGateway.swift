//
//  UserDefaultsGateway.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 18/09/24.
//

import Foundation

protocol UserDefaultsGateway {
    func set<T: Codable>(value: T, forKey: String)
    func get<T: Codable>(forKey: String) -> T?
    func delete(forKey: String)
}

class UserDefaultsGatewayImpl: UserDefaultsGateway {
    func set<T: Codable>(value: T, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    func get<T: Codable>(forKey: String) -> T? {
        return UserDefaults.standard.value(forKey: forKey) as? T
    }
    
    func delete(forKey: String) {
        UserDefaults.standard.removeObject(forKey: forKey)
    }
}
